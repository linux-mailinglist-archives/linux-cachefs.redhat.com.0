Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86D50DFE0
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Apr 2022 14:22:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-RkHRwLQZPmm8RRQqFgJHNg-1; Mon, 25 Apr 2022 08:22:08 -0400
X-MC-Unique: RkHRwLQZPmm8RRQqFgJHNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05F1A3806738;
	Mon, 25 Apr 2022 12:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0070469A7D;
	Mon, 25 Apr 2022 12:22:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C26D11940345;
	Mon, 25 Apr 2022 12:22:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 717AD1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 25 Apr 2022 12:22:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 306B1145BF05; Mon, 25 Apr 2022 12:22:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC95145BEEE
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 154C585A5BE
 for <linux-cachefs@redhat.com>; Mon, 25 Apr 2022 12:22:05 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-LNE5LrNHNzO3FIlowuIB1A-1; Mon, 25 Apr 2022 08:22:01 -0400
X-MC-Unique: LNE5LrNHNzO3FIlowuIB1A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=20; SR=0; TI=SMTPD_---0VBE4bFj_1650889315
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VBE4bFj_1650889315) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Apr 2022 20:21:56 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org
Date: Mon, 25 Apr 2022 20:21:29 +0800
Message-Id: <20220425122143.56815-8-jefflexu@linux.alibaba.com>
In-Reply-To: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH v10 07/21] cachefiles: add tracepoints for
 on-demand read mode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: zhujia.zj@bytedance.com, gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add tracepoints for on-demand read mode. Currently following tracepoints
are added:

	OPEN request / COPEN reply
	CLOSE request
	READ request / CREAD reply
	write through anonymous fd
	release of anonymous fd

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Acked-by: David Howells <dhowells@redhat.com>
---
 fs/cachefiles/ondemand.c          |   7 ++
 include/trace/events/cachefiles.h | 174 ++++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index 3470d4e8f0cb..a41ae6efc545 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -30,6 +30,7 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
 	xa_unlock(&cache->reqs);
 
 	xa_erase(&cache->ondemand_ids, object_id);
+	trace_cachefiles_ondemand_fd_release(object, object_id);
 	cachefiles_put_object(object, cachefiles_obj_put_ondemand_fd);
 	cachefiles_put_unbind_pincount(cache);
 	return 0;
@@ -55,6 +56,7 @@ static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
 	if (ret < 0)
 		return ret;
 
+	trace_cachefiles_ondemand_fd_write(object, file_inode(file), pos, len);
 	ret = __cachefiles_write(object, file, pos, iter, NULL, NULL);
 	if (!ret)
 		ret = len;
@@ -93,6 +95,7 @@ static long cachefiles_ondemand_fd_ioctl(struct file *filp, unsigned int ioctl,
 	if (!req)
 		return -EINVAL;
 
+	trace_cachefiles_ondemand_cread(object, id);
 	complete(&req->done);
 	return 0;
 }
@@ -166,6 +169,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
 		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
 	else
 		set_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
+	trace_cachefiles_ondemand_copen(req->object, id, size);
 
 out:
 	complete(&req->done);
@@ -213,6 +217,7 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
 	object->ondemand_id = object_id;
 
 	cachefiles_get_unbind_pincount(cache);
+	trace_cachefiles_ondemand_open(object, &req->msg, load);
 	return 0;
 
 err_put_fd:
@@ -426,6 +431,7 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
 		return -ENOENT;
 
 	req->msg.object_id = object_id;
+	trace_cachefiles_ondemand_close(object, &req->msg);
 	return 0;
 }
 
@@ -452,6 +458,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
 	req->msg.object_id = object_id;
 	load->off = read_ctx->off;
 	load->len = read_ctx->len;
+	trace_cachefiles_ondemand_read(object, &req->msg, load);
 	return 0;
 }
 
diff --git a/include/trace/events/cachefiles.h b/include/trace/events/cachefiles.h
index 93df9391bd7f..d8d4d73fe7b6 100644
--- a/include/trace/events/cachefiles.h
+++ b/include/trace/events/cachefiles.h
@@ -673,6 +673,180 @@ TRACE_EVENT(cachefiles_io_error,
 		      __entry->error)
 	    );
 
+TRACE_EVENT(cachefiles_ondemand_open,
+	    TP_PROTO(struct cachefiles_object *obj, struct cachefiles_msg *msg,
+		     struct cachefiles_open *load),
+
+	    TP_ARGS(obj, msg, load),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj		)
+		    __field(unsigned int,	msg_id		)
+		    __field(unsigned int,	object_id	)
+		    __field(unsigned int,	fd		)
+		    __field(unsigned int,	flags		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->msg_id	= msg->msg_id;
+		    __entry->object_id	= msg->object_id;
+		    __entry->fd		= load->fd;
+		    __entry->flags	= load->flags;
+			   ),
+
+	    TP_printk("o=%08x mid=%x oid=%x fd=%d f=%x",
+		      __entry->obj,
+		      __entry->msg_id,
+		      __entry->object_id,
+		      __entry->fd,
+		      __entry->flags)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_copen,
+	    TP_PROTO(struct cachefiles_object *obj, unsigned int msg_id,
+		     long len),
+
+	    TP_ARGS(obj, msg_id, len),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj	)
+		    __field(unsigned int,	msg_id	)
+		    __field(long,		len	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->msg_id	= msg_id;
+		    __entry->len	= len;
+			   ),
+
+	    TP_printk("o=%08x mid=%x l=%lx",
+		      __entry->obj,
+		      __entry->msg_id,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_close,
+	    TP_PROTO(struct cachefiles_object *obj, struct cachefiles_msg *msg),
+
+	    TP_ARGS(obj, msg),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj		)
+		    __field(unsigned int,	msg_id		)
+		    __field(unsigned int,	object_id	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->msg_id	= msg->msg_id;
+		    __entry->object_id	= msg->object_id;
+			   ),
+
+	    TP_printk("o=%08x mid=%x oid=%x",
+		      __entry->obj,
+		      __entry->msg_id,
+		      __entry->object_id)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_read,
+	    TP_PROTO(struct cachefiles_object *obj, struct cachefiles_msg *msg,
+		     struct cachefiles_read *load),
+
+	    TP_ARGS(obj, msg, load),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj		)
+		    __field(unsigned int,	msg_id		)
+		    __field(unsigned int,	object_id	)
+		    __field(loff_t,		start		)
+		    __field(size_t,		len		)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->msg_id	= msg->msg_id;
+		    __entry->object_id	= msg->object_id;
+		    __entry->start	= load->off;
+		    __entry->len	= load->len;
+			   ),
+
+	    TP_printk("o=%08x mid=%x oid=%x s=%llx l=%zx",
+		      __entry->obj,
+		      __entry->msg_id,
+		      __entry->object_id,
+		      __entry->start,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_cread,
+	    TP_PROTO(struct cachefiles_object *obj, unsigned int msg_id),
+
+	    TP_ARGS(obj, msg_id),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj	)
+		    __field(unsigned int,	msg_id	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->msg_id	= msg_id;
+			   ),
+
+	    TP_printk("o=%08x mid=%x",
+		      __entry->obj,
+		      __entry->msg_id)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_fd_write,
+	    TP_PROTO(struct cachefiles_object *obj, struct inode *backer,
+		     loff_t start, size_t len),
+
+	    TP_ARGS(obj, backer, start, len),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj	)
+		    __field(unsigned int,	backer	)
+		    __field(loff_t,		start	)
+		    __field(size_t,		len	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->backer	= backer->i_ino;
+		    __entry->start	= start;
+		    __entry->len	= len;
+			   ),
+
+	    TP_printk("o=%08x iB=%x s=%llx l=%zx",
+		      __entry->obj,
+		      __entry->backer,
+		      __entry->start,
+		      __entry->len)
+	    );
+
+TRACE_EVENT(cachefiles_ondemand_fd_release,
+	    TP_PROTO(struct cachefiles_object *obj, int object_id),
+
+	    TP_ARGS(obj, object_id),
+
+	    TP_STRUCT__entry(
+		    __field(unsigned int,	obj		)
+		    __field(unsigned int,	object_id	)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->obj	= obj ? obj->debug_id : 0;
+		    __entry->object_id	= object_id;
+			   ),
+
+	    TP_printk("o=%08x oid=%x",
+		      __entry->obj,
+		      __entry->object_id)
+	    );
+
 #endif /* _TRACE_CACHEFILES_H */
 
 /* This part must be outside protection */
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

