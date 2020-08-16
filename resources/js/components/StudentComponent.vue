<template>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 d-flex justify-content-between align-items-baseline">
                <h1>Students</h1>
                <div>
                    <button @click="create_mode = true; reset_student()" class="btn-primary btn float-right">Create
                    </button>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover table-bordered text-nowrap">
                            <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Date Created</th>
                                <th>Date Updated</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(student,index) in students" :key="index">
                                <td class="td_editable" @click="update_student(student,index,'first_name')">
                                    {{ student.first_name }}
                                </td>
                                <td class="td_editable" @click="update_student(student,index,'last_name')">
                                    {{ student.last_name }}
                                </td>
                                <td class="td_editable" @click="update_student(student,index,'email')">{{
                                        student.email
                                    }}
                                </td>
                                <td>{{ student.created_at | formatted_time }}</td>
                                <td>{{ student.updated_at  | formatted_time }}</td>
                                <td>
                                    <button class="btn btn-danger btn-sm" @click="delete_student(student)">
                                        Delete
                                    </button>
                                    <button class="btn btn-primary btn-sm" @click="manage_student_lectures(student)">
                                        Class
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>

        <!--create modal-->
        <div v-if="create_mode">
            <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Create Student</h5>
                                    <button type="button" @click="create_mode = false" class="close"
                                            data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form @submit.prevent="create_student">
                                        <div class="form-group">
                                            <label for="cfirst_name">First Name</label>
                                            <input type="text" id="cfirst_name" v-model="student.first_name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="clast_anem">Last Name</label>
                                            <input type="text" id="clast_anem" v-model="student.last_name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label for="cemail">Email</label>
                                            <input type="text" id="cemail" v-model="student.email" class="form-control">
                                        </div>
                                        <button class="btn btn-primary btn-sm float-right">create</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
        <!--class modal-->
        <div v-if="class_mode">
            <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-dialog modal-xl" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Edit {{ student.first_name + ' ' + student.last_name }}
                                        Class</h5>
                                    <button type="button" @click="class_mode = false" class="close"
                                            data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    Currently Enrolled In
                                                </div>
                                                <div class="card-body table-responsive p-0">
                                                    <table class="table table-hover table-bordered text-nowrap">
                                                        <thead>
                                                        <tr>
                                                            <th>Course</th>
                                                            <th>Start Time</th>
                                                            <th>End Time</th>
                                                            <th>Remove</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="(lecture,index) in enrolled_in" :key="index">
                                                            <td>{{ lecture.name }}</td>
                                                            <td>{{ lecture.start_time }}</td>
                                                            <td>{{ lecture.end_time }}</td>
                                                            <td>
                                                                <button class="btn-sm btn btn-danger btn-block"
                                                                        @click="remove_lecture(lecture,index)">Remove
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!--not enrolled in-->
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    Not Enrolled In
                                                </div>
                                                <div class="card-body table-responsive p-0">
                                                    <table class="table table-hover table-bordered text-nowrap">
                                                        <thead>
                                                        <tr>
                                                            <th>Course</th>
                                                            <th>Start Time</th>
                                                            <th>End Time</th>
                                                            <th>Remove</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr v-for="(lecture,index) in not_enrolled_in" :key="index">
                                                            <td>{{ lecture.name }}</td>
                                                            <td>{{ lecture.start_time }}</td>
                                                            <td>{{ lecture.end_time }}</td>
                                                            <td>
                                                                <button class="btn-sm btn btn-primary btn-block"
                                                                        @click="add_lecture(lecture,index)">Add
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            create_mode: false,
            class_mode: false,
            students: [],
            all_lectures: [],
            enrolled_in: [],
            not_enrolled_in: [],
            student: {
                first_name: "",
                last_name: "",
                email: ""
            }
        }
    },
    mounted() {
        this.getStudents();
    },
    methods: {
        async getStudents() {
            const result = await axios.get('/all_students')
            this.students = result.data
        },
        async delete_student(student) {
            let res = await Swal.fire({
                title: 'Delete Student?',
                text: `Are you sure you want to delete ${student.first_name} ${student.last_name}`,
                icon: 'question',
                showCancelButton: true,
                showLoaderOnConfirm: true,
                async preConfirm(val) {
                    try {
                        return await axios.delete(`/students/${student.id}`)
                    } catch (e) {
                        Swal.fire('Oops', 'Something went wrong!', 'error')
                        return false
                    }
                }
            })
            if (res.value) {
                Swal.fire('Success', `${student.first_name} ${student.last_name} successfully deleted!`, 'success')
                this.students = this.students.filter(s => s != student)
            }
        },
        reset_student() {
            this.student = {
                first_name: "",
                last_name: "",
                email: ""
            }
        },
        async update_student(student, index, ctx) {
            this.student = student
            const context = ctx.replace('_', ' ')
            Swal.fire({
                title: `Update student's ${context}`,
                html:
                    `<p>Previous ${context}: ${student[ctx]}</p>` +
                    '<input id="col" name="col" type="text" class="swal2-input">',
                focusConfirm: false,
                showCancelButton: true,
                showLoaderOnConfirm: true,
                preConfirm: async () => {
                    let val = document.querySelector('#col').value.trim();
                    if (val) {
                        try {
                            return await axios.patch(`/students/${student.id}/update`, {[ctx]: val, field: ctx})
                        } catch (error) {
                            let error_messages = format_errors(error.response.data.errors)
                            Swal.fire(error.response.data.message, error_messages, 'warning');
                            return false
                        }
                    }
                    Swal.fire('Invalid Name', 'Name provided is invalid', 'warning');
                    return false
                }
            }).then(res => {
                if (res.value) {
                    this.student = this.students.splice(index, 1, res.value.data);
                }
            })

        },
        async create_student() {
            try {
                const result = await axios.post('/students', this.student)
                Swal.fire('Success', 'Student was successfully added!', 'success')
                this.students.unshift(result.data);
                this.reset_student();
                this.create_mode = false;
            } catch (e) {
                let error_messages = format_errors(e.response.data.errors)
                Swal.fire({
                    title: e.response.data.message,
                    text: error_messages,
                    icon: 'warning'
                })
            }
        },
        async manage_student_lectures(student) {
            this.student = student;
            await this.get_lectures();
            this.class_mode = true;

        }, async get_lectures() {
            const response = await axios.get(`/student/${this.student.id}/lectures`)
            this.all_lectures = response.data.all
            this.enrolled_in = response.data.enrolled_in
            this.not_enrolled_in = this.all_lectures.filter(lec => this.enrolled_in.map(l => l.id).indexOf(lec.id) < 0)
        }, async remove_lecture(lecture, index) {
            Swal.fire({
                title: `Are you sure?`,
                text: 'Are you sure you want to remove this lecture?',
                icon: 'question',
                focusConfirm: false,
                showCancelButton: true,
                showLoaderOnConfirm: true,
                allowOutsideClick: false,
                preConfirm: async () => {
                    const response = await axios.delete(`student/${this.student.id}/lectures/${lecture.id}`)
                    await this.get_lectures();
                    return response;
                }
            }).then(res => {
                if (res.value) {
                    Swal.fire('Success', 'Lecture Removed', 'success')
                }
            })
        }, async add_lecture(lecture, index) {
            Swal.fire({
                title: `Are you sure?`,
                text: 'Are you sure you want to add this lecture?',
                icon: 'question',
                focusConfirm: false,
                showCancelButton: true,
                showLoaderOnConfirm: true,
                allowOutsideClick: false,
                preConfirm: async () => {
                    const response = await axios.post(`student/${this.student.id}/lectures/${lecture.id}`)
                    await this.get_lectures();
                    return response;
                }
            }).then(res => {
                if (res.value) {
                    Swal.fire('Success', 'Lecture Added', 'success')
                }
            })
        }
    },
    filters: {
        formatted_time(time) {
            return formatted_time(time);
        }
    }
}
</script>
<style scoped>
.modal-mask {
    position: fixed;
    z-index: 10;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, .5);
    display: table;
    transition: opacity .3s ease;
}

.modal-wrapper {
    display: table-cell;
}
</style>
