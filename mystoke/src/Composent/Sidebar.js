
import React, { useState } from 'react';
import {
    FaTh,
    FaBars,
    FaShoppingBag,
    FaUserAlt
    
}from "react-icons/fa";
import { NavLink } from 'react-router-dom';


const Sidebar = ({children}) => {
    const[isOpen ,setIsOpen] = useState(false);
    const toggle = () => setIsOpen (!isOpen);
    const menuItem=[
        {
            path:"/",
            name:"Dashboard",
            icon:<FaTh/>
        },
      
        {
            path:"/product",
            name:"Product",
            icon:<FaShoppingBag/>
        },
        {
          path:"/user",
          name:"user",
          icon:< FaUserAlt/>
      },
    ]
    return (
        <div className="container-fluid  bg-light min-vh-100 ">
           <div style={{width: isOpen ? "210px" : "50px"}} className="sidebar pd-4">
               <div className="top_section">
                   <h1 style={{display: isOpen ? "block" : "none"}} className="logo">Elfouladh</h1>
                   <div style={{marginLeft: isOpen ? "10px" : "0px"}} className="bars">
                       <FaBars onClick={toggle}/>
                   </div>
               </div>
               {
                   menuItem.map((item, index)=>(
                       <NavLink to={item.path} key={index} className="link" activeclassName="active">
                           <div className="icon">{item.icon}</div>
                           <div style={{display: isOpen ? "block" : "none"}} className="link_text">{item.name}</div>
                       </NavLink>
                   ))
               }
           </div>
           <main className=' bg-light '><div className='row'><div style={{width: isOpen ? "210px" : "0px"}}></div><div className='col'>{children}</div></div></main>
        </div>
    );
};

export default Sidebar;