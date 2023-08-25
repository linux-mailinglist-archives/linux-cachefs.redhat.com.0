Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8509278D400
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383818;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s25s1XsNyfG9JAyEFnv8XA16OaxQqHNWjjZSx4vLoxs=;
	b=FkeynTIrMQQxQR3rhBuliL8406bJDhz2kE0ddiE6bLQhHgvkfkr1+CDqCjXeVDDRU4z0gd
	uN8BgkUKwbmCmTrH49a1Cm8OYAybcMxB8pgevd8ScEQViOL/QEtjLWx/d6p0pu2z5VM4V0
	V+woQa6ga1ygk9D/7kD2gI29/PSpjtM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-dUWnfKPyM6OJCMo-PNA_9w-1; Wed, 30 Aug 2023 04:23:35 -0400
X-MC-Unique: dUWnfKPyM6OJCMo-PNA_9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74D91C05140;
	Wed, 30 Aug 2023 08:23:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCECE40C6F4E;
	Wed, 30 Aug 2023 08:23:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA21519452D9;
	Wed, 30 Aug 2023 08:23:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0953519465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:07:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E649E40C2079; Fri, 25 Aug 2023 14:07:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF32E40C2073
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:07:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC0FB1C07554
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 14:07:25 +0000 (UTC)
Received: from out-242.mta1.migadu.com (out-242.mta1.migadu.com
 [95.215.58.242]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-nDlOfG7JOkSDOEGWHqvQbg-1; Fri, 25 Aug 2023 10:07:23 -0400
X-MC-Unique: nDlOfG7JOkSDOEGWHqvQbg-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:31 +0800
Message-Id: <20230825135431.1317785-30-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 29/29] io_uring: add support for getdents
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

This add support for getdents64 to io_uring, acting exactly like the
syscall: the directory is iterated from it's current's position as
stored in the file struct, and the file's position is updated exactly as
if getdents64 had been called.

For filesystems that support NOWAIT in iterate_shared(), try to use it
first; if a user already knows the filesystem they use do not support
nowait they can force async through IOSQE_ASYNC in the sqe flags,
avoiding the need to bounce back through a useless EAGAIN return.

Co-developed-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 include/uapi/linux/io_uring.h |  1 +
 io_uring/fs.c                 | 53 +++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |  3 ++
 io_uring/opdef.c              |  8 ++++++
 4 files changed, 65 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 8e61f8b7c2ce..3896397a1998 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -240,6 +240,7 @@ enum io_uring_op {
 	IORING_OP_URING_CMD,
 	IORING_OP_SEND_ZC,
 	IORING_OP_SENDMSG_ZC,
+	IORING_OP_GETDENTS,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index f6a69a549fd4..04711feac4e6 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -47,6 +47,12 @@ struct io_link {
 	int				flags;
 };
 
+struct io_getdents {
+	struct file			*file;
+	struct linux_dirent64 __user	*dirent;
+	unsigned int			count;
+};
+
 int io_renameat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_rename *ren = io_kiocb_to_cmd(req, struct io_rename);
@@ -291,3 +297,50 @@ void io_link_cleanup(struct io_kiocb *req)
 	putname(sl->oldpath);
 	putname(sl->newpath);
 }
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+	struct io_getdents *gd = io_kiocb_to_cmd(req, struct io_getdents);
+
+	if (READ_ONCE(sqe->off))
+		return -EINVAL;
+
+	gd->dirent = u64_to_user_ptr(READ_ONCE(sqe->addr));
+	gd->count = READ_ONCE(sqe->len);
+
+	return 0;
+}
+
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags)
+{
+	struct io_getdents *gd = io_kiocb_to_cmd(req, struct io_getdents);
+	struct file *file = req->file;
+	unsigned long getdents_flags = 0;
+	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
+	bool locked;
+	int ret;
+
+	if (force_nonblock) {
+		if (!(file->f_flags & O_NONBLOCK) &&
+		    !(file->f_mode & FMODE_NOWAIT))
+			return -EAGAIN;
+
+		getdents_flags = DIR_CONTEXT_F_NOWAIT;
+	}
+
+	ret = file_pos_lock_nowait(file, force_nonblock);
+	if (ret == -EAGAIN)
+		return ret;
+	locked = ret;
+
+	ret = vfs_getdents(file, gd->dirent, gd->count, getdents_flags);
+	if (locked)
+		file_pos_unlock(file);
+
+	if (ret == -EAGAIN && force_nonblock)
+		return -EAGAIN;
+
+	io_req_set_res(req, ret, 0);
+	return 0;
+}
+
diff --git a/io_uring/fs.h b/io_uring/fs.h
index 0bb5efe3d6bb..f83a6f3a678d 100644
--- a/io_uring/fs.h
+++ b/io_uring/fs.h
@@ -18,3 +18,6 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue_flags);
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags);
 void io_link_cleanup(struct io_kiocb *req);
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags);
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 3b9c6489b8b6..1bae6b2a8d0b 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -428,6 +428,11 @@ const struct io_issue_def io_issue_defs[] = {
 		.prep			= io_eopnotsupp_prep,
 #endif
 	},
+	[IORING_OP_GETDENTS] = {
+		.needs_file		= 1,
+		.prep			= io_getdents_prep,
+		.issue			= io_getdents,
+	},
 };
 
 
@@ -648,6 +653,9 @@ const struct io_cold_def io_cold_defs[] = {
 		.fail			= io_sendrecv_fail,
 #endif
 	},
+	[IORING_OP_GETDENTS] = {
+		.name			= "GETDENTS",
+	},
 };
 
 const char *io_uring_get_opcode(u8 opcode)
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

