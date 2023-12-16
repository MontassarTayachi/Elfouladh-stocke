import React,{useEffect, useState } from "react";
import Navbar from './Navbar'
import BgColorExample from "../viwes/card"
import TableSorti from "../viwes/TableListSorti"
function Menu() {
  const [poids1, setpoids1] = useState([]);
  const [poids2, setpoids2] = useState([]);
  const [poids3, setpoids3] = useState([]);
  const [poids4, setpoids4] = useState([]);
  const getAciers = async () => {
    try {
      const response = await fetch("/sum/BILLETTES");
      const jsonData = await response.json();

      setpoids1(jsonData);
    } catch (err) {
      console.error(err.message);}

  }
  const getAciers2 = async () => {
    try {
      const response2 = await fetch("/sum/ROND_A_BETON");
      const jsonData2 = await response2.json();

      setpoids2(jsonData2);
    } catch (err) {
      console.error(err.message);}

  }

  const getAciers3 = async () => {
    try {
      const response3 = await fetch("/sum/FILS");
      const jsonData3 = await response3.json();

      setpoids3(jsonData3);
    } catch (err) {
      console.error(err.message);}

  }
  const getAciers4 = async () => {
    try {
      const response4 = await fetch("/sum/STRUCTURES_METALIQUES");
      const jsonData4 = await response4.json();

      setpoids4(jsonData4);
    } catch (err) {
      console.error(err.message);}

  }
  
  useEffect(() => {
    getAciers();
    getAciers2 ();
    getAciers3();
    getAciers4 ();
  }, []);
  console.log(poids1);
  console.log(poids2);
  console.log(poids3);
  console.log(poids4);
  return (
 <div className='px-20  bg-light'>
  <Navbar Navbarname="Dashborad"/>
  <div className='col'>
    <div className='row m-2'>
    <div className=' col-md-3'><BgColorExample BgColor="Warning" header="BILLETTES" title=" IN Stoke" text1={poids1.somme_poids} text2={poids1.nombre_total_lignes}/></div>
  <div className='col-md-3'><BgColorExample BgColor="Info" header="ROND A BETON" title=" IN Stoke" text1={poids2.somme_poids} text2={poids2.nombre_total_lignes} /></div>
  <div className='col-md-3'><BgColorExample BgColor="Light" header="FILS" title=" IN Stoke" text1={poids3.somme_poids} text2={poids3.nombre_total_lignes}/></div>
  <div className='col-md-3'><BgColorExample BgColor="Secondary" header="STRUCTURES METALIQUES" title=" IN Stoke" text1={poids4.somme_poids} text2={poids4.nombre_total_lignes}/></div>
    </div>
    <div className='row m-2' > <TableSorti tablename="BILLETTES"/></div>
    <div className='row m-2'> <TableSorti tablename="ROND A BETON"/></div>
    <div className='row m-2'> <TableSorti tablename="FILS"/></div>
    <div className='row m-2'> <TableSorti tablename="STRUCTURES METALIQUES"/></div>
  </div>
  </div>
  )
}


export default Menu