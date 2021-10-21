const price =()=>{
  const itemPrice=document.getElementById("item-price")
  itemPrice.addEventListener("input",()=>{
    const inputPrice=itemPrice.value 
    const taxPrice=document.getElementById("add-tax-price")
    taxPrice.innerHTML=`${Math.floor(inputPrice*0.1)}`
    const proFit=document.getElementById("profit")
    proFit.innerHTML=`${inputPrice-Math.floor(inputPrice*0.1)}`
   

  })
}
window.addEventListener('load',price)

