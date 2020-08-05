CREATE TABLE category (
  id             SERIAL NOT NULL, 
  name_category  varchar(45) NOT NULL, 
  state_category varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_name_category 
    UNIQUE (name_category));
COMMENT ON COLUMN category.id IS 'Llave primaria.';
COMMENT ON COLUMN category.name_category IS 'Nombre de la categoría.';
COMMENT ON COLUMN category.state_category IS 'Estado actual de la categoría [''Activo'',''Inactivo''].';
CREATE TABLE "user" (
  id               SERIAL NOT NULL, 
  name             varchar(45) NOT NULL, 
  username         varchar(45) NOT NULL, 
  email            varchar(60) NOT NULL, 
  password         varchar(80) NOT NULL, 
  image_path       text NOT NULL, 
  state_user       varchar(20) NOT NULL, 
  user_description text, 
  activation_key   int4, 
  reset_key        int4, 
  reset_date       int4, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_email 
    UNIQUE (email), 
  CONSTRAINT uk_username 
    UNIQUE (username));
COMMENT ON COLUMN "user".id IS 'Llave primaria.';
COMMENT ON COLUMN "user".name IS 'Nombre completo del usuario registrado.';
COMMENT ON COLUMN "user".username IS 'Nombre de usuario registrado.';
COMMENT ON COLUMN "user".email IS 'Correo electrónico del usuario registrado.';
COMMENT ON COLUMN "user".password IS 'Contraseña del usuario registrado.';
COMMENT ON COLUMN "user".image_path IS 'Dirección de la imagen de perfil del usuario registrado.';
COMMENT ON COLUMN "user".state_user IS 'Estado actual en todo momento del usuario registrado [''Activo'',''Inactivo'',''Baneado''].';
COMMENT ON COLUMN "user".user_description IS 'Descripción del usuario.';
COMMENT ON COLUMN "user".activation_key IS 'Llave o token generado para el registro del usuario.';
COMMENT ON COLUMN "user".reset_key IS 'Llave o token generado para la recuperación de la contraseña del usuario registrado.';
COMMENT ON COLUMN "user".reset_date IS 'Fecha en la que se pidió recuperar la contraseña del usuario registrado.';
CREATE TABLE project (
  id                  SERIAL NOT NULL, 
  name_project        varchar(45) NOT NULL, 
  project_description text NOT NULL, 
  capacity            int4 NOT NULL, 
  status_project      varchar(20) NOT NULL, 
  img_project         text, 
  url_repo            text, 
  url_demo            text, 
  created_at          timestamp, 
  finished_at         timestamp, 
  observation         text, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_name 
    UNIQUE (name_project));
COMMENT ON COLUMN project.id IS 'Llave primaria.';
COMMENT ON COLUMN project.name_project IS 'Nombre del proyecto creado por un usuario.';
COMMENT ON COLUMN project.project_description IS 'Descripción del proyecto creado por el usuario. Se debe especificar lo que va a realizarse en el proyecto.';
COMMENT ON COLUMN project.capacity IS 'Número de integrantes permitidos en el proyecto.';
COMMENT ON COLUMN project.status_project IS 'Estado actual del proyecto en todo momento [''Activo'', ''Inactivo'',''Finalizado'',''Rechazado'',''Aprobado'',''En espera''].';
COMMENT ON COLUMN project.img_project IS 'Url en donde se encuentra la imagen.';
COMMENT ON COLUMN project.url_repo IS 'Url donde se encuentra el repositorio del proyecto.';
COMMENT ON COLUMN project.url_demo IS 'Url donde se encuentra alojado el demo.';
COMMENT ON COLUMN project.created_at IS 'Fecha de creación del proyecto.';
COMMENT ON COLUMN project.finished_at IS 'Fecha en la que finalizó el proyecto.';
COMMENT ON COLUMN project.observation IS 'Motivo u especificación del estado actual del proyecto.';
CREATE TABLE project_user (
  id                 SERIAL NOT NULL, 
  id_project         int4 NOT NULL, 
  id_user            int4 NOT NULL, 
  state_user_project varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_project_user 
    UNIQUE (id_project, id_user));
COMMENT ON COLUMN project_user.id IS 'Llave primaria.';
COMMENT ON COLUMN project_user.id_project IS 'Llave foránea de project.';
COMMENT ON COLUMN project_user.id_user IS 'Llave foránea de user.';
COMMENT ON COLUMN project_user.state_user_project IS 'Estado actual del usuario en el proyecto [''Activo'',''Inactivo'',''Expulsado'',''Abandono''].';
CREATE TABLE skill_project (
  id         SERIAL NOT NULL, 
  id_project int4 NOT NULL, 
  id_skill   int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_skill_project 
    UNIQUE (id_project, id_skill));
COMMENT ON COLUMN skill_project.id IS 'Llave primaria.';
COMMENT ON COLUMN skill_project.id_project IS 'Llave foránea de project.';
COMMENT ON COLUMN skill_project.id_skill IS 'Llave foránea de skill.';
CREATE TABLE project_team (
  id                 SERIAL NOT NULL, 
  id_team            int4 NOT NULL, 
  id_project         int4 NOT NULL, 
  state_project_team varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_project_team 
    UNIQUE (id_team, id_project));
COMMENT ON COLUMN project_team.id IS 'Llave primaria.';
COMMENT ON COLUMN project_team.id_team IS 'Llave foránea de team.';
COMMENT ON COLUMN project_team.id_project IS 'Llave foránea de project.';
COMMENT ON COLUMN project_team.state_project_team IS 'Estado actual del equipo en el proyecto [''Activo'',''Inactivo''].';
CREATE TABLE skill (
  id          SERIAL NOT NULL, 
  name_skill  varchar(45) NOT NULL, 
  state_skill varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_name_skill 
    UNIQUE (name_skill));
COMMENT ON COLUMN skill.id IS 'Llave primaria.';
COMMENT ON COLUMN skill.name_skill IS 'Nombre de la skill.';
COMMENT ON COLUMN skill.state_skill IS 'Estado actual de la skill [''Activo'',''Inactivo''].';
CREATE TABLE skill_user (
  id       SERIAL NOT NULL, 
  id_user  int4 NOT NULL, 
  id_skill int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_user_skill 
    UNIQUE (id_user, id_skill));
COMMENT ON COLUMN skill_user.id IS 'Llave primaria.';
COMMENT ON COLUMN skill_user.id_user IS 'Llave foránea de user.';
COMMENT ON COLUMN skill_user.id_skill IS 'Llave foránea de skill.';
CREATE TABLE social_media (
  id                 SERIAL NOT NULL, 
  name_social        varchar(45) NOT NULL, 
  social_logo        text NOT NULL, 
  state_social_media varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_social_name 
    UNIQUE (name_social));
COMMENT ON COLUMN social_media.id IS 'Llave primaria.';
COMMENT ON COLUMN social_media.name_social IS 'Nombre de la red social.';
COMMENT ON COLUMN social_media.social_logo IS 'Url de ubicación para logo de la red social.';
COMMENT ON COLUMN social_media.state_social_media IS 'Estado actual de la red social [''Activo'',''Inactivo''].';
CREATE TABLE social_media_user (
  id              SERIAL NOT NULL, 
  id_social_media int4 NOT NULL, 
  id_user         int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_media_user 
    UNIQUE (id_social_media, id_user));
COMMENT ON COLUMN social_media_user.id IS 'Llave primaria.';
COMMENT ON COLUMN social_media_user.id_social_media IS 'Llave foránea de social media.';
COMMENT ON COLUMN social_media_user.id_user IS 'Llave foránea de user.';
CREATE TABLE team (
  id               SERIAL NOT NULL, 
  name_team        varchar(45) NOT NULL, 
  team_description text NOT NULL, 
  team_capacity    int4 NOT NULL, 
  state_team       varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_name_team 
    UNIQUE (name_team));
COMMENT ON COLUMN team.id IS 'Llave primaria.';
COMMENT ON COLUMN team.name_team IS 'Nombre del equipo creado.';
COMMENT ON COLUMN team.team_description IS 'Descripción de las actividades que realiza el equipo.';
COMMENT ON COLUMN team.team_capacity IS 'Número de personas permitidas a entrar en el equipo.';
COMMENT ON COLUMN team.state_team IS 'Estado actual en el que se encuentra el equipo [''Activo'',''Inactivo''].';
CREATE TABLE team_project (
  id              SERIAL NOT NULL, 
  id_team         int4 NOT NULL, 
  id_project_user int4 NOT NULL, 
  state_user_team varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_project_user_team 
    UNIQUE (id_team, id_project_user));
COMMENT ON COLUMN team_project.id IS 'Llave primaria.';
COMMENT ON COLUMN team_project.id_team IS 'Llave foránea de team.';
COMMENT ON COLUMN team_project.id_project_user IS 'Llave foránea de project user.';
COMMENT ON COLUMN team_project.state_user_team IS 'Estado del usuario en el equipo [''Activo'',''Inactivo''].';
CREATE TABLE skill_category (
  id          SERIAL NOT NULL, 
  id_skill    int4 NOT NULL, 
  id_category int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_skill_category 
    UNIQUE (id_skill, id_category));
COMMENT ON COLUMN skill_category.id IS 'Llave primaria.';
COMMENT ON COLUMN skill_category.id_skill IS 'Llave foránea de skill.';
COMMENT ON COLUMN skill_category.id_category IS 'Llave foránea de category.';
CREATE TABLE category_project (
  id          SERIAL NOT NULL, 
  id_category int4 NOT NULL, 
  id_project  int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_category_project 
    UNIQUE (id_category, id_project));
COMMENT ON COLUMN category_project.id IS 'Llave primaria.';
COMMENT ON COLUMN category_project.id_category IS 'Llave foránea de category.';
COMMENT ON COLUMN category_project.id_project IS 'Llave foránea de project.';
CREATE TABLE rol (
  id       SERIAL NOT NULL, 
  name_rol int4 NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_name_rol 
    UNIQUE (name_rol));
COMMENT ON COLUMN rol.id IS 'Llave primaria.';
COMMENT ON COLUMN rol.name_rol IS 'Nombre del rol de usuario.';
CREATE TABLE rol_user (
  id        SERIAL NOT NULL, 
  id_rol    int4 NOT NULL, 
  id_user   int4 NOT NULL, 
  state_rol varchar(20) NOT NULL, 
  PRIMARY KEY (id), 
  CONSTRAINT uk_rol_user 
    UNIQUE (id_rol, id_user));
COMMENT ON COLUMN rol_user.id IS 'Llave primaria.';
COMMENT ON COLUMN rol_user.id_rol IS 'Llave foránea de rol.';
COMMENT ON COLUMN rol_user.id_user IS 'Llave foránea de user.';
COMMENT ON COLUMN rol_user.state_rol IS 'Estado actual del rol [''Activo'',''Inactivo''].';
ALTER TABLE project_user ADD CONSTRAINT fk_id_project_id_contributor FOREIGN KEY (id_project) REFERENCES project (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE project_user ADD CONSTRAINT fk_project_user FOREIGN KEY (id_user) REFERENCES "user" (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE skill_project ADD CONSTRAINT fk_skill_project FOREIGN KEY (id_project) REFERENCES project (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE skill_project ADD CONSTRAINT fk_skill FOREIGN KEY (id_skill) REFERENCES skill (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE project_team ADD CONSTRAINT fk_project_team FOREIGN KEY (id_team) REFERENCES team (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE project_team ADD CONSTRAINT fk_proj_team FOREIGN KEY (id_project) REFERENCES project (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE skill_user ADD CONSTRAINT fk_user_skill FOREIGN KEY (id_user) REFERENCES "user" (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE skill_user ADD CONSTRAINT fk_skill_user FOREIGN KEY (id_skill) REFERENCES skill (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE social_media_user ADD CONSTRAINT fk_social_media_user FOREIGN KEY (id_social_media) REFERENCES social_media (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE social_media_user ADD CONSTRAINT fk_user_social_media FOREIGN KEY (id_user) REFERENCES "user" (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE team_project ADD CONSTRAINT fk_team_project FOREIGN KEY (id_team) REFERENCES team (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE team_project ADD CONSTRAINT fk_project_user_team FOREIGN KEY (id_project_user) REFERENCES project_user (id) ON UPDATE Restrict ON DELETE Restrict;
ALTER TABLE skill_category ADD CONSTRAINT fk_skill_category FOREIGN KEY (id_skill) REFERENCES skill (id);
ALTER TABLE skill_category ADD CONSTRAINT fk_category_skill FOREIGN KEY (id_category) REFERENCES category (id);
ALTER TABLE category_project ADD CONSTRAINT fk_project_category FOREIGN KEY (id_category) REFERENCES category (id);
ALTER TABLE category_project ADD CONSTRAINT fk_category_project FOREIGN KEY (id_project) REFERENCES project (id);
ALTER TABLE rol_user ADD CONSTRAINT fk_rol_user FOREIGN KEY (id_rol) REFERENCES rol (id);
ALTER TABLE rol_user ADD CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "user" (id);
