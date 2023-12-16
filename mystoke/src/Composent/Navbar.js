import React from 'react'
import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/collapse'
import  image  from './Elfoulath.png'

function Navbar(props) {
  return (
   <nav className="navbar navbar-expand-sm navbar-dark bg-tranparent rounded mx-3"> 
   <img className='' src={image} alt='img' style={{ width: '50px', height: '50px' }}/>
   <p className='text-dark m-4'><strong>{props.Navbarname}</strong></p>
       <button className="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId"
           aria-expanded="false" aria-label="Toggle navigation"> <i className='bi bi-justify'></i></button>
       <div className="collapse navbar-collapse" id="collapsibleNavId">
           <ul className="navbar-nav ms-auto mt-2 mt-lg-0">
               <li className="nav-item dropdown">
                   <a className="nav-link dropdown-toggle text-dark" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Montassar</a>
                   <div className="dropdown-menu" aria-labelledby="dropdownId">
                       <a className="dropdown-item" href="#">profile</a>
                       <a className="dropdown-item" href="#">Setting</a>
                       <a className="dropdown-item" href="#">logout</a>
                   </div>
               </li>
           </ul>
          
       </div>
   </nav>
  )
}

export default Navbar