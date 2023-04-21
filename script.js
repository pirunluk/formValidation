const form = document.getElementById('form')
const firstname = document.getElementById('firstname')
const lastname = document.getElementById('lastname')
const email = document.getElementById('email')
const password = document.getElementById('password')
const mobile = document.getElementById('mobile')
const gender = document.getElementById('gender')
const skill = document.getElementById('skill')
const experience = document.getElementById('experience')

form.addEventListener('submit',function(e){
    e.preventDefault()
    console.log('ok');

    if(firstname.value === ''){
        showError(firstname,'Firstname is required')
    }else if(!validateEngChar(firstname.value)){
        showError(firstname,'Firstname must be in English only')
    }else{
        showSuccess(firstname)
    }

    if(lastname.value === ''){
        showError(lastname,'Lastname is required')
    }else if(!validateEngChar(lastname.value)){
        showError(lastname,'Lastname must be in English only')
    }else{
        showSuccess(lastname)
    }
    
    if(email.value === ''){
        showError(email,'Email is required')
    }else if(!validateEmail(email.value)){
        showError(email,'Must be a valid email')
    }else{
        showSuccess(email)
    }

    if(password.value === ''){
        showError(password,'Password is required')
    }else if(password.value.length < 8){
        showError(password,'Password must be at least 8 characters')
    }else{
        showSuccess(password)
    }

    if(mobile.value === ''){
        showError(mobile,'Mobile number is required')
    }else if(!validateMobile(mobile.value)){
        showError(mobile,'Must be a valid mobile number')
    }else{
        showSuccess(mobile)
    }
})

function showError(input,msg){
    const fromControl = input.parentElement
    fromControl.className = 'box error'
    const small = fromControl.querySelector('small')
    small.innerText = msg
}

function showSuccess(input){
    const fromControl = input.parentElement
    fromControl.className = 'box success'

}

function validateEmail(email){
    const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    return re.test(String(email).toLowerCase())
}

function validateMobile(mobile) {
    var patt = new RegExp(/^s*?\(?\d{3}(?:\)|[-|\s])?\s*?\d{3}[-|\s]?\d{4}$/);
    return patt.test(mobile);
}

function validateEngChar(input){
    const re = /[A-Za-z]/
    return re.test(String(input))
}

