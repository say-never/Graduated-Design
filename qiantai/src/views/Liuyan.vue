<template>
  <div id="container" style="width: 80%; margin: 5px auto">
    <el-row :gutter="20">
      <el-col :span="24">
        <div class="comment">
          <div class="comment-item">
            <el-row
              v-for="item in comments"
              :key="item.id"
              style="margin-top: 20px"
            >
              <el-col :span="4" style="text-align: center"
                >{{ item.cheng }} 发送：</el-col
              >
              <el-col :span="18">
                <el-row>
                  <el-col :span="12" style="text-align: justify">{{
                    item.biaoti
                  }}</el-col>
                  <el-col :span="12" style="text-align: justify">{{
                    item.addtime | datePipe("yyyy-MM-dd hh:mm:ss")
                  }}</el-col>
                  <div
                    style="color: #888; margin-left: -150px; padding-top: 30px"
                    v-for="child in item.children"
                    :key="child.id"
                  >
                    <el-col :span="4" style="text-align: center"
                      >{{ child.cheng }} 回复：</el-col
                    >
                    <el-col :span="18">
                      <el-row>
                        <el-col :span="12">{{ child.biaoti }}</el-col>
                        <el-col :span="12" style="text-align: right">{{
                          child.addtime | datePipe("yyyy-MM-dd hh:mm:ss")
                        }}</el-col>
                      </el-row>
                    </el-col>
                  </div>
                  <el-col :span="12" style="margin-top: 20px">
                    <el-input
                      type="text"
                      class="form-control"
                      style="width: 70%; display: inline-block"
                      v-model="item.replayText"
                    />
                    <el-button
                      type="primary"
                      @click="reply(item.id, item.replayText)"
                      >回复</el-button
                    >
                  </el-col>
                </el-row>
              </el-col>
            </el-row>
          </div>
        </div>
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <h2>留言</h2>
          </div>
        </div>
        <div class="comment-item">
          <el-row>
            <el-input
              type="textarea"
              rows="3"
              v-model="comment.biaoti"
            ></el-input>
          </el-row>
          <el-row>
            <el-button type="primary" @click="add()">发送</el-button>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { mapActions } from "vuex";
export default {
  data() {
    return {
      comment: {},
      comments: [],
    };
  },
  watch: {
    $route(to, from) {
      this.$router.go(0);
    },
  },
  created() {
    let user = localStorage.getItem("user");
    if (!user) {
      this.notifyError("请先登录");
    }
    this.userInfo = JSON.parse(localStorage.getItem("user"));
    this.getComment();
  },
  methods: {
    ...mapActions(["unshiftShoppingCart", "addShoppingCartNum"]),
    // 获取评论详细信息
    getComment() {
      this.$axios
        .get("/api/front/getLiuyan")
        .then((res) => {
          this.comments = res.data.data;
        })
        .catch((err) => {
          return Promise.reject(err);
        });
    },
    add() {
      if (this.comment.biaoti == "") {
        alert('请输入内容再发表留言')
      }else{
        this.comment.parentId = 0;
        this.comment.zhanghao = this.userInfo.zhanghao;
        this.comment.cheng = this.userInfo.gerenmingcheng;
        this.$axios.post("/api/front/addLiuyan", this.comment).then((res) => {
          if (res.data.code === "0") {
            this.getComment(this.id);
            this.comment.biaoti = "";
          } else {
            alert(res.data.msg);
          }
        });
      }
    },
    reply(id, content) {
      if (!content) {
        this.notifyError("请填写回复内容");
        return;
      }
      let data = {
        biaoti: content,
        zhanghao: this.userInfo.zhanghao,
        cheng: this.userInfo.gerenmingcheng,
        parent: id,
      };
      this.$axios.post("/api/front/addLiuyan", data).then((res) => {
        this.getComment();
      });
    },
  },
};
</script>
<style>
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
  height: 500px;
  padding-top: 30px;
  margin: 0 auto;
}
#details .main .block {
  float: left;
  width: 560px;
  height: 500px;
}
#details .main .content {
  float: left;
  margin-left: 25px;
  width: 640px;
}

</style>
