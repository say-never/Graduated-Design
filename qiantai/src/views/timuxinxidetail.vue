<template>
  <div id="details">
    <!-- 头部 -->
    <div class="page-header">
      <div class="title" style="font-size: 14px">
        <p>首页>> 题目信息列表 >> 题目信息详细</p>
      </div>
    </div>
    <!-- 内容主体 -->
    <div class="main">
      <div class="content">
        <table
          width="100%"
          border="0"
          align="center"
          cellpadding="3"
          cellspacing="1"
          style="border-bottom: #c9c9c9 1px dashed"
        >
          <tr>
            <td width="11%" height="60px;">题目名称：</td>
            <td width="39%" height="60px;">
              {{ timuxinxidetail.timumingcheng }}
            </td>
            <td width="11%" height="60px;">题目标签：</td>
            <td width="39%" height="60px;">
              {{ timuxinxidetail.timubiaoqian }}
            </td>
          </tr>
          <tr>
            <td width="11%" height="60px;">题目类型：</td>
            <td width="39%" height="60px;">
              {{ timuxinxidetail.timuleixing }}
            </td>
            <td width="11%" height="60px;">题目难度：</td>
            <td width="39%" height="60px;">{{ timuxinxidetail.timunandu }}</td>
          </tr>
          <tr>
            <td width="11%">题目文档：</td>
            <td width="39%">
              <el-button size="small" @click="download(timuxinxidetail)"
                >点此下载</el-button
              >
            </td>
            <td width="11%" height="60px;">上传人：</td>
            <td width="39%" height="60px;">
              {{ timuxinxidetail.shangchuanren }}
            </td>
          </tr>
        </table>
        <div id="container" style="width: 1225px; margin: 5px auto">
          <el-row :gutter="20">
            <el-col :span="24">
              <div>
                <el-row>
                  <el-card shadow="hover">
                    <div slot="header" style="text-align: center">
                      <span>题目描述</span>
                    </div>
                    <div v-html="timuxinxidetail.timumiaoshu"></div>
                  </el-card>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </div>
        <!-- 按钮 -->
        <div class="button">
          <el-button class="like" @click="handleEdit()">我有话说</el-button>
          <el-button class="shop-cart" @click="addCollect">收藏</el-button>
        </div>
      </div>
      <!-- 评论 -->
      <el-table size="small" :data="pinglun" highlight-current-row border>
        <el-table-column sortable prop="pingfen" label="评分"></el-table-column>
        <el-table-column
          sortable
          prop="pinglunneirong"
          label="评论内容"
        ></el-table-column>
        <el-table-column
          sortable
          prop="pinglunren"
          label="评论人"
        ></el-table-column>
        <el-table-column sortable prop="addtime" label="添加时间" width="160">
        </el-table-column>
      </el-table>

      <el-dialog
        :visible.sync="editFormVisible"
        width="30%"
        @click="closeDialog"
      >
        <el-form label-width="120px" :model="editForm" ref="editForm">
          <el-form-item label="评论内容" prop="pinglunneirong"
            ><el-input
              type="textarea"
              size="small"
              v-model="editForm.pinglunneirong"
              auto-complete="off"
              placeholder="请输入评论内容"
              style="width: 100%"
            ></el-input
          ></el-form-item>
          <el-form-item label="评分" prop="pingfen">
            <el-radio v-model="editForm.pingfen" label="1">1</el-radio>
            <el-radio v-model="editForm.pingfen" label="2">2</el-radio>
            <el-radio v-model="editForm.pingfen" label="3">3</el-radio>
            <el-radio v-model="editForm.pingfen" label="4">4</el-radio>
            <el-radio v-model="editForm.pingfen" label="5">5</el-radio>
          </el-form-item>
          <el-form-item label="表" prop="biao" style="display: none"
            ><el-input
              size="small"
              v-model="editForm.biao"
              auto-complete="off"
              placeholder="请输入表"
              style="width: 50%"
            ></el-input
          ></el-form-item>
          <el-form-item label="表" prop="shujuid" style="display: none"
            ><el-input
              size="small"
              v-model="editForm.shujuid"
              auto-complete="off"
              placeholder="请输入表"
              style="width: 50%"
            ></el-input
          ></el-form-item>
          <el-form-item label="评论人" prop="pinglunren"
            ><el-input
              size="small"
              v-model="editForm.pinglunren"
              auto-complete="off"
              placeholder="请输入评论人"
              style="width: 50%"
              disabled
            ></el-input
          ></el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button size="small" @click="closeDialog">取消</el-button>
          <el-button
            size="small"
            type="primary"
            class="title"
            @click="submitForm('editForm')"
            >保存</el-button
          >
        </div>
      </el-dialog>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      pinglun: [], // 评论列表
      dis: false, // 控制“收藏是否可用”
      timuxinxiID: "",
      timuxinxidetail: "", // 题目详细信息
      editFormVisible: false,
      editForm: {
        pingfen: "5",
      },
    };
  },
  watch: {
    $route(to, from) {
      // 路由发生变化页面刷新
      this.$router.go(0);
    },
  },
  created() {
    this.timuxinxiID = this.$route.params.id;
    let id = this.$route.params.id;
    this.id = id;
    this.getDetails(id);
    this.getpinglun();
  },
  methods: {
    handleEdit: function () {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      debugger;
      this.editFormVisible = true;
      this.title = "添加评论";
      //this.editForm = {}
      this.editForm.biao = "timuxinxi";
      //this.editForm.pingfen="5";
      this.editForm.shujuid = this.timuxinxiID;

      this.userInfo = JSON.parse(localStorage.getItem("user"));
      this.editForm.pinglunren = this.userInfo.zhanghao;
    },

    getpinglun() {
      this.$axios
        .post("/api/front/pinglun", {
          biao: "timuxinxi",
          shujuid: this.timuxinxiID,
        })
        .then((res) => {
          debugger;
          this.pinglun = res.data.data.list;
          this.total = res.data.data.total;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
    closeDialog() {
      this.editFormVisible = false;
    },
    submitForm(editData) {
      this.$refs[editData].validate((valid) => {
        if (valid) {
          this.$axios
            .post("/api/front/postpinglun/", this.editForm)
            .then((res) => {
              if (res.data.code == "0") {
                this.editFormVisible = false;
                this.getpinglun();
                this.$message({
                  type: "success",
                  message: "评论成功！",
                });
              } else {
                this.$message({
                  type: "info",
                  message: res.msg,
                });
              }
            })
            .catch((err) => {
              if (err) {
                this.$message.error(err);
              } else {
                this.$message.error("操作失败，请稍后再试！");
              }
            });
        } else {
          return false;
        }
      });
    },

    // 获取题目详细信息
    getDetails(val) {
      this.$axios
        .get("/api/front/gettimuxinxidetail/" + val)
        .then((res) => {
          debugger;
          this.timuxinxidetail = res.data.data;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
    // 下载文档
    download(date) {
      location.href = "http://localhost:9999/" + date.timuwendang;
    },
    addCollect() {
      // 判断是否登录,没有登录则显示登录组件
      if (!this.$store.getters.getUser) {
        this.$store.dispatch("setShowLogin", true);
        return;
      }
      debugger;
      this.$axios
        .post("/api/front/addCollect", {
          userId: this.$store.getters.getUser.id,
          shangpinxinxiID: this.timuxinxiID,
        })
        .then((res) => {
          if (res.data.code == "0") {
            this.notifySucceed(res.data.msg);
          } else {
            this.notifyError(res.data.msg);
          }
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
  },
};
</script>
<style>
@import "../assets/css/index.scss";
/* 头部CSS */
#details .page-header {
  height: 64px;
  margin-top: -20px;
  z-index: 4;
  background: #fff;
  border-bottom: 1px solid #e0e0e0;
  -webkit-box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
  box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.07);
}
#details .page-header .title {
  width: 1225px;
  height: 64px;
  line-height: 64px;
  font-size: 18px;
  font-weight: 400;
  color: #212121;
  margin: 0 auto;
}
#details .page-header .title p {
  float: left;
}
#details .page-header .title .list {
  height: 64px;
  float: right;
}
#details .page-header .title .list li {
  float: left;
  margin-left: 20px;
}
#details .page-header .title .list li a {
  font-size: 14px;
  color: #616161;
}
#details .page-header .title .list li a:hover {
  font-size: 14px;
  color: #ff6700;
}
/* 头部CSS END */

/* 主要内容CSS */
#details .main {
  width: 1225px;
  padding-top: 30px;
  margin: 0 auto;
}
#details .main .block {
  float: left;
  width: 560px;
}
#details .el-carousel .el-carousel__indicator .el-carousel__button {
  background-color: rgba(163, 163, 163, 0.8);
}
#details .main .content {
  float: left;
  margin-left: 25px;
  width: 100%;
}
#details .main .content .name {
  height: 30px;
  line-height: 30px;
  font-size: 24px;
  font-weight: normal;
  color: #212121;
}
#details .main .content .intro {
  color: #b0b0b0;
  padding-top: 10px;
}
#details .main .content .store {
  color: #ff6700;
  padding-top: 10px;
}
#details .main .content .price {
  display: block;
  font-size: 18px;
  color: #ff6700;
  border-bottom: 1px solid #e0e0e0;
  padding: 25px 0 25px;
}
#details .main .content .price .del {
  font-size: 14px;
  margin-left: 10px;
  color: #b0b0b0;
  text-decoration: line-through;
}
#details .main .content .pro-list {
  background: #f9f9fa;
  padding: 30px 60px;
  margin: 50px 0 50px;
}
#details .main .content .pro-list span {
  line-height: 30px;
  color: #616161;
}
#details .main .content .pro-list .pro-price {
  float: right;
}
#details .main .content .pro-list .pro-price .pro-del {
  margin-left: 10px;
  text-decoration: line-through;
}
#details .main .content .pro-list .price-sum {
  color: #ff6700;
  font-size: 24px;
  padding-top: 20px;
}
#details .main .content .button {
  height: 55px;
  margin: 10px 0 20px 0;
}
#details .main .content .button .el-button {
  float: left;
  height: 55px;
  font-size: 16px;
  color: #fff;
  border: none;
  text-align: center;
}
#details .main .content .button .shop-cart {
  width: 340px;
  background-color: #ff6700;
}
#details .main .content .button .shop-cart:hover {
  background-color: #f25807;
}

#details .main .content .button .like {
  width: 260px;
  margin-left: 40px;
  background-color: #b0b0b0;
}
#details .main .content .button .like:hover {
  background-color: #757575;
}
#details .main .content .pro-policy li {
  float: left;
  margin-right: 20px;
  color: #b0b0b0;
}
/* 主要内容CSS END */
</style>
