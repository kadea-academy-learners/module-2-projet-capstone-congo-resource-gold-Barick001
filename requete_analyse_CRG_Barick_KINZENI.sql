-- 						Mission A
-- 1. ici je compte le nombre d'engins par site--
SELECT count(id_engin) as "Nombre d'engins par site" 
from engins 
group by id_site;

-- 2. je veux identifier les jours ou la production a ete nulle
select *   
from production
where tonnage_brut = 0;

--3. Je veux afficher la liste des engins avec le nom de leur site respectif

select nom as nom_site,type as nom_engins from sites
 inner join engins on sites.id_site = engins.id_site;

 --      					Mission B
 --1. Je veux afficher la somme du tonnage brut par province et type de Minerai

 select 
 province,
 type_minerai, 
 sum(tonnage_brut) as somme_de_tonnage_brut
 from production
 inner join sites on production.id_site=sites.id_site
 group by province,type_minerai
 order	by
 province,
 somme_de_tonnage_brut desc;

-- 2. Je veux afficher le tonnage de metal pur 

 select *,(tonnage_brut * (teneur/100)) as tonnage_de_metal_pur
 from production
 inner join sites on production.id_site=sites.id_site;

--3. je veux afficher le chiffres d'affaires total par site

 select
 s.id_site,
 s.nom as nom_site,
 s.province,
 sum(e.tonnage_vendu*e.prix_unitaire_usd) as chiffre_affaires_total
 from sites s
 join 
 exportations e on s.id_site = e.id_site
 group by
 s.id_site,
 s.nom,
 s.province;

-- 4. je veux lister les sites dont la teneur moyenne est inferieure à 2.5

select p.id_prod,
        s.nom as nom_site,
		p.teneur
 from production p
 join sites s on p.id_site=s.id_site
 where teneur <2.5;


 
