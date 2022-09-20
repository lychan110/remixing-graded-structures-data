# remixing-graded-structures-data

The multiclass blending code and data of "Remixing Functionally Graded Structures: Data-Driven Topology Optimization with Multiclass Shape Blending" by Chan et al. Using this blending scheme, functionally graded structures can be optimized under a data-driven framework.

![RemixFramework](./img/Figxx_blending_demo_v2.png?raw=true)

## Blending Scripts and Demo

The code of the proposed multiclass blending scheme is in `.\src\blending\shapeBlending.m`.

![BlendingScheme](./img/Figxx_blending_uc_demo.png?raw=true)

To run a demo of blending in MATLAB or Octave, navigate to `.\src\` and run:
```
demo_blending_2d.m
```

By interpolating between sets of blending coefficients (not included in the demo), one can achieve smooth and connected changes between different microstructures, such as below.

![BlendingScheme](./img/Figxx_blending_demo_selected.png?raw=true)

## Data

We also provide the datasets described in Sec. 3.1 of our paper.

![TrainingData](./img/Figxx_blend_property_space.png?raw=true)

### Basis Classes

`.\src\data_basis_classes` contains the basis classes (signed distance functions and other relevant parameters) in `*.mat` format. See the demo for more information on how to use them for blending.

### Training Data for Property Prediction Neural Networks

`.\src\data_training` contains the datasets created by sampling the blending coefficients. They are used to train the property prediction models for data-driven topology optimization.

- `*_coeffs.csv`: Coefficients of the shape blending scheme, or the predictors (X) in the models
- `*_props.csv`: Linear elastic stiffness tensor components and volume fractions, or the responses (Y) in the models

### Morphology types

Each folder above contains the datasets for two morphology types:

- `dpp_2d_sp20`: Shape and property diverse freeform classes (20 total; only the first 5 are used in the paper)
- `truss_2d_red5`: Truss-type classes (5 total)

## Citation

If our data and/or code has been useful in your research, please cite our work:

Chan, Y.-C., Da, D., Wang, L. et al. [Remixing functionally graded structures: data-driven topology optimization with multiclass shape blending](https://doi.org/10.1007/s00158-022-03224-x). _Struct Multidisc Optim_ 65, 135 (2022).

- [arXiv version available](https://arxiv.org/abs/2112.00648)

```BibTeX
@article{Chan2022Remix,
	doi = {10.1007/s00158-022-03224-x},
	year = 2022,
	month = {apr},
	publisher = {Springer Science and Business Media {LLC}},
	volume = {65},
	number = {5},
	author = {Yu-Chin Chan and Daicong Da and Liwei Wang and Wei Chen},
	title = {Remixing functionally graded structures: data-driven topology optimization with multiclass shape blending},
	journal = {Structural and Multidisciplinary Optimization}
}
```
