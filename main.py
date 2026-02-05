from sklearn.metrics.pairwise import cosine_similarity  # Assuming scikit-learn installed in env
import numpy as np

def recommend_jobs(user_skills, job_requirements):
    user_vector = np.array([user_skills])
    job_vectors = np.array(job_requirements)
    similarities = cosine_similarity(user_vector, job_vectors)
    return similarities.argsort()[-3:][::-1]  # Top 3 matches for premium users

# Example usage
user_skills = [1, 0, 1]  # e.g., skills vector
jobs = [[1, 1, 0], [0, 1, 1], [1, 0, 0]]
print(recommend_jobs(user_skills, jobs))