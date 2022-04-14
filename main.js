/*
Author:Murtadha Marzouq
@description: This is the main file that loads all the components
@date: 04/13/2022
*/

const LanguagesComponent = () => {
  let html = ''
  for (i in Object.keys(information.Languages)) {
    html += `<ul><li>${information.Languages[i]}</li></ul>`
  }
  return `<h3 id="Languages">  Languages:   </h3>  ${html}`
}

const PublicationsComponent = () => {
  let html = ''
  for (i in Object.keys(information.Publications)) {
    html += `<ul><li><a id="publications"  href="${information.Publications[i].url}">${information.Publications[i].name}</a> - ${information.Publications[i].description}</li> </ul>`
  }
  return `<h3 id="Publications">  Publications:   </h3>  ${html}`
}

const EducationComponent = () => {
  let html = ''
  for (i in Object.keys(information.Education)) {
    let education = information.Education[i]
    let educationComponent = document.createElement('div')
    educationComponent.classList.add('education')

    educationComponent.innerHTML += `

      <p id="school">${education.school}</p>

      <p id="degree">${education.degree} in ${education.major}</p>
      <p id="year" >${education.status} in  ${education.year}</p>
      <p id="award">Awarded: ${education.awards}</p>
      `
    html += educationComponent.outerHTML
    //document.querySelector("#column-1").appendChild(educationComponent);
  }

  return `<h3 id="Education">  Education:   </h3>  ${html}`
}

const SkillsComponent = () => {
  let Skills =
    `<h3 id="Skills">Skills:</h3>` +
    information.Skills.map((skill) => {
      return `

    <ul>
       <li id="skill">${skill}</li>
     </ul>`
    }).join('')

  return Skills
}

const CertificationComponent = () => {
  let html = ''
  for (i in Object.keys(information.Certification)) {
    let certification = information.Certification[i]
    let certificationComponent = document.createElement('div')
    certificationComponent.classList.add('certification')

    certificationComponent.innerHTML += `
      <a href=${certification.Link} id="cert_link">  <p id="certification">${certification.Certification}</p> </a>
      <p id="date">Certification Year: ${certification.Date}</p>
      <p id="describtion"> ${certification.Describtion}</p>
      `
    html += certificationComponent.outerHTML
  }
  return '<h3 id="Certification">Certification:</h3>' + html
}

const ExperienceComponent = () => {
  let html = ''
  for (i in Object.keys(information.Experience)) {
    let experience = information.Experience[i]
    let experienceComponent = document.createElement('div')
    experienceComponent.classList.add('experience')
    experienceComponent.innerHTML += `
      <p id="company">${experience.company}</p>
      <p id="title">${experience.title}</p>
      <p id="location">${experience.location} | ${experience.startDate} - ${
      experience.endDate
    }</p>
      <p id="Responsibilities"><strong>Responsibilities:</strong> ${experience.Responsibilities.map(
        (responsibility) => {
          return `
        <ul>
          <li id="responsibility">${responsibility}</li>
        </ul>`
        },
      ).join('')}</p>
      `
    html += experienceComponent.outerHTML
  }
  return '<h3 id="Experience">Experience:</h3>' + html
}
const InterestComponent = () => {
  let html = ''
  for (i in Object.keys(information.Interests)) {
    let interest = information.Interests[i]
    let interestComponent = document.createElement('div')
    interestComponent.classList.add('interest')
    interestComponent.innerHTML += `
      <ul>
        <li id="interest">${interest}</li>

      </ul>`
    html += interestComponent.outerHTML
  }

  return '<h3 id="Interests">Interests:</h3>' + html
}

const NavBar = () => {
  let html = `<h1 id="name">${information.Name}</h1> <div id="navbar" class="links">`

  console.log(information.Links)

  phone = html += `<a  class="phone" id="link"    href="${information.Links['phone']}"}"> (213)-458-4982 || Charlotte NC</a> `
  html += `<a  class="email}" id="link"    href="${information.Links['email']}"}"> mmarzouq@uncc.edu</a> `
  html += `<a  class="Github" id="link"    href="${information.Links['Github']}"}"> Github</a> `
  html += `<a  class="website" id="link"    href="${information.Links['Website']}"}"> Website</a> `

  document.getElementById(
    'header',
  ).innerHTML = `${html}  </div><img src=${information.Picture} id="profile_picture" alt="Profile Picture"> `

  return `${html}  </div> <img src=${information.Picture} id="profile_picture" alt="Profile Picture"> `
}

const load = () => {
  //Setting up the image
  // Creating Components
  let sections = Object.keys(information)
  let Education = EducationComponent()
  let Objective =
    '<h3 id="Objective"> Objectives: </h3>' + information.Objective
  let Skills = SkillsComponent()
  let Certification = CertificationComponent()
  let Experience = ExperienceComponent()
  let Interest = InterestComponent()
  let Publications = PublicationsComponent()
  let Languages = LanguagesComponent()

  // Creating Elements for each section
  let Firstcolumn = document.createElement('div')
  let Secondcolumn = document.createElement('div')
  let educatoion = document.createElement('section')
  let objective = document.createElement('section')
  let skills = document.createElement('section')
  let certification = document.createElement('section')
  let experience = document.createElement('section')
  let interest = document.createElement('section')
  let publications = document.createElement('section')
  let languages = document.createElement('section')
  // setting the sections
  educatoion.innerHTML = Education
  objective.innerHTML = Objective
  skills.innerHTML = Skills
  certification.innerHTML = Certification
  experience.innerHTML = Experience
  interest.innerHTML = Interest
  publications.innerHTML = Publications
  languages.innerHTML = Languages
  // Add sections to sectionsArray
  Firstcolumn.appendChild(objective)
  Firstcolumn.appendChild(educatoion)
  Firstcolumn.appendChild(certification)
  Firstcolumn.appendChild(experience)
  Secondcolumn.appendChild(skills)
  Secondcolumn.appendChild(interest)
  Secondcolumn.appendChild(publications)
  Secondcolumn.appendChild(languages)

  // Appending Components
  document.querySelector('#column-1').appendChild(Firstcolumn)
  document.querySelector('#column-2').appendChild(Secondcolumn)

  // Setting the Name
}

var information = {}

window.onload = () => {
  fetch(
    'https://raw.githubusercontent.com/MurtadhaM/FindASnake/main/information.json',
  )
    .then((response) => response.json())
    .then((data) => {
      information = data
      NavBar()
      load()
    })
}
