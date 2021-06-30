# Adaptive-Hypergraph-Learning-with-Multi-Stage-Optimizations-for-Image-and-Tag-Recommendation
This is a Matlab implementation of Hypergraph multi-stage optimization scheme (HMSO) and HMSO using Least Mean Squares (LMS), i.e., HMSO (LMS), of Adaptive Hypergraph Learning with Multi Stage Optimizations for Image and Tag Recommendation journal paper. 
# run HMSO
In order to run the proposed HMSO approach for the Greek POIs dataset, navigate to folder "experiments_on_greek_pois_dataset" and run the script main.m. All necessary functions to run main.m are included in folder "functions".
## HMSO results compared to other methods
![all_methods](https://user-images.githubusercontent.com/33315386/123764807-cd592980-d8cd-11eb-893a-9621d821e8e0.png)

# run HMSO (LMS)
In order to run the proposed HMSO (LMS), navigate to folder "experiments_on_thessaloniki_dataset" and run the script main.m. All necessary functions to run main.m are included in folder "functions". Note: running HMSO (LMS) on a big dataset, such as greek_pois_dataset, has extremely high time requirements. Thus, we strongly recommend you run HMSO (LMS) on datasets with limited size.
## HMSO (LMS) results compared to HMSO
![HMSO_HMSO_LMS](https://user-images.githubusercontent.com/33315386/123765631-96374800-d8ce-11eb-8419-037225699452.png)

# Cite
If you find this code useful in your research, please consider citing:
```
@article{karantaidis2021,
  title={Adaptive Hypergraph Learning with Multi Stage Optimizations for Image and Tag Recommendation},
  author={Karantaidis G. and Sarridis I. and Kotropoulos C.},
  journal={Signal Processing: Image Communication},
  volume={pending...},
  number={pending...},
  pages={pending...},
  year={2021},
  publisher={Elsevier},
  doi={https://doi.org/10.1016/j.image.2021.116367}
}
```


