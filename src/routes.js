import { Router } from 'express';
import multer from 'multer';
import multerConfig from './config/multer';

import UsuarioController from './app/controllers/UsuarioController';
import SessionController from './app/controllers/SessionController';
import BlogController from './app/controllers/BlogController';
import PaiimgsController from './app/controllers/PaiimgsController';
import BannerController from './app/controllers/BannerController';
import FileController from './app/controllers/FileController';
import ViagensController from './app/controllers/ViagensController';
import ContatoformsController from './app/controllers/ContatoformsController';
import ReservasController from './app/controllers/ReservasController';
import OndeestamosController from './app/controllers/OndeestamosController';
import BuscaController from './app/controllers/BuscaController';

import authMiddleware from './app/middlewares/auth';

const routes = new Router();
const upload = multer(multerConfig);

routes.post('/usuarios', UsuarioController.store);
routes.post('/sessions', SessionController.store);

routes.get('/blog', BlogController.index);
routes.get('/postsrelacionados/:id', BlogController.relacionados);
routes.get('/blog/:id', BlogController.detail);

routes.get('/viagens', ViagensController.index);
routes.get('/viagenshome', ViagensController.home);
routes.get('/viagensrealizadas', ViagensController.realizadas);
routes.get('/viagensrelacionadas/:id', ViagensController.relacionados);
routes.get('/viagens/:id', ViagensController.detail);

routes.get('/busca', BuscaController.index);

routes.post('/contato', ContatoformsController.store);

routes.post('/reserva', ReservasController.store);

routes.get('/ondeestamos', OndeestamosController.index);
routes.get('/ondeestamos/:id', OndeestamosController.detail);

routes.get('/', (req, res) => res.send('ok'));

routes.get('/albuns', ViagensController.galeria);

routes.get('/galeria/:id', PaiimgsController.index);

routes.get('/banner', BannerController.index);

routes.use(authMiddleware);

routes.get('/contato', ContatoformsController.index);
routes.delete('/contato/:id', ContatoformsController.delete);

routes.get('/reserva', ReservasController.index);
routes.delete('/reserva/:id', ReservasController.delete);

routes.get('/usuarios', UsuarioController.index);
routes.put('/usuarios', UsuarioController.update);
routes.delete('/usuarios/:id', UsuarioController.delete);

routes.post('/blog', BlogController.store);
routes.put('/blog/:id', BlogController.update);
routes.delete('/blog/:id', BlogController.delete);

routes.post('/galeria', PaiimgsController.store);
routes.delete('/galeria/:id', PaiimgsController.delete);
routes.put('/albumgaleria/:id', PaiimgsController.excluirAlbum);

routes.post('/banner', BannerController.store);
routes.delete('/banner/:id', BannerController.delete);

routes.post('/viagens', ViagensController.store);
routes.put('/viagens/:id', ViagensController.update);
routes.delete('/viagens/:id', ViagensController.delete);


routes.post('/ondeestamos', OndeestamosController.store);
routes.put('/ondeestamos/:id', OndeestamosController.update);
routes.delete('/ondeestamos/:id', OndeestamosController.delete);

routes.post('/files', upload.single('file'), FileController.store);

export default routes;
