Return-Path: <linux-cachefs+bncBDLIXLMFVAERBK7PZCVQMGQEOUWNA4I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D580934C
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:52 +0100 (CET)
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-db402e6f61dsf1723535276.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984171; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Pd7/LG1BvVoYnlwfHsAGDqnkHPyII7I4i/Qp8hluKTeUuLBOu4K0F32fp+05nc7FZ
         iOjcj0rQhe/Bi75MdA4/V3kx+D/c4GVBC+OtUfLmP10sFVytmUeC+TRbP91kI1ZUpbhH
         DIA6tbIiAU/kHfpgWzF9idLBaGFv1tJgQTOO8Pmslx9GYlQRsLJyDZAjdp1MCCbcdLYk
         eT5k2wt9FDEqAFmUdm+kd7Y92vo/BU971eDJsSxMRirL6JaMwptLtyJ4L5svd23pH9yY
         +oLA9bBNkoLy51o+7cnEBFe2vusqU/5iqUCXNX3iytQ+tW3DtNVUdg6/rlZIQ1fQS1dV
         wqbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Jg05BnWtMDQwK/h+tQIgmLbAvSJ4iEMY9clcuqTNz7E=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=GEMcB+CXNoLaFhoKoGV2SjOrE9C/Dz8LATRFUlpJrtwojewiVYwx2htR5IXApYVgKV
         YR+Xg2N7WZn/1t+6tjMWjLPkmKOucS7++vukL/eh9QTaLNA9jwJWkt5WoBzJwsdJ2EoN
         AlTCut1HxVOQqwwCsCMGSIi2D2umRrLCYSZo3XUjnBdys5Jq1PJMk72dltq6TI5dcmoU
         iUwT851T+KPdBQe70jr5qq+fTbvSF7fjPP9UiwFdFhYlFIshh8gwrLm7KOCi/h+2dEMy
         wlkXsgaaTdoMvKlvYmwJrlbYYJWLmOZCmFwq8wjoziP5OhoNRBxQ7vD3fjfpD0j3g01s
         J6Pg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984171; x=1702588971;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg05BnWtMDQwK/h+tQIgmLbAvSJ4iEMY9clcuqTNz7E=;
        b=YXWdsVk73coWY8Fw0SeESpDdWmrH1PdFZt8NLb0BrTMr4xclLZ+IZj1rBElXY4yyWJ
         HvRhh0FaD2vZyapkHRmc8PK0IsSqL5nYon+XptOtBDasz/IeeKskIDk9Fh1PaIh8f27u
         HRNuGCuTuaGR1SZiM1jLFoY2ry/kRZiOrC4+9JHnNaQHGKz74j+XTE1JOFETmrp85z1t
         u+3d/vlV3ku2XP3P6rUC/yzQQvsb4n9Uy1hUUtIDlT7B+yH89y6OAemix0EX4V2LnC4E
         OK8Wbzp1O0AdEl+dnUHJouRzqQrHbN+ptMI+YAEfx1oYChSdUYy8gImNNmuzx6iz4DYh
         gDiQ==
X-Gm-Message-State: AOJu0YxwfFmtouESAG4RYrBfR2m+9cpkncbdj1HTCuWW8R3L5kOqCuP8
	Kv7026VL6pmlfYEgLPdFUCJzIw==
X-Google-Smtp-Source: AGHT+IEiV9LHTF0h+ayywtX1ZW0mxHbNJjnqaF/pxkNTwhMA4lxVOXEJSIRopICW6lGdxz/ATa0hEQ==
X-Received: by 2002:a25:ab11:0:b0:db7:dad0:60dd with SMTP id u17-20020a25ab11000000b00db7dad060ddmr2839594ybi.106.1701984171166;
        Thu, 07 Dec 2023 13:22:51 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:e052:0:b0:da0:33b3:b1b5 with SMTP id x79-20020a25e052000000b00da033b3b1b5ls1369800ybg.0.-pod-prod-08-us;
 Thu, 07 Dec 2023 13:22:50 -0800 (PST)
X-Received: by 2002:a25:d755:0:b0:db5:4005:7859 with SMTP id o82-20020a25d755000000b00db540057859mr3158786ybg.36.1701984170468;
        Thu, 07 Dec 2023 13:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984170; cv=none;
        d=google.com; s=arc-20160816;
        b=g3k5/1du2zC7FwCyZDYBjx38FNGJrlIehqoaND6WR1+/gZwYWU6WXBf4e5I9VKgB+p
         rtnm6sm2gVW7+aJ/GrABix58xceRkw9aM0wUB2LTnVdovVu5jEBhGXBpAe9tK6s/74pw
         y3NRmqNAuUB8B/KEUwrmKSR0X9o3bA+MPjVapIglxSgTv3ctgkqyDmb0Rh1NaTk4Gv6X
         Riqy9fqvG1/G+BNqznGuig0tKt+1S+noYoh0u4RGQmLpvu0/6T8oGAh2cvZJq6FhmIlZ
         rXu8/gLOvN7wJRPkOFoXRbx9iW0WtanSd8rRtaaER/ijuSHRqh1i9f7UF6QKAKOmitcR
         Q1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=hI7SPLixeI9nlQ4BAck1nNakLW38S3QG1L7ZzowPna4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Yp4bnmVCnUt7nyKaMjI5SlDXbw7NoNMKY1lLXcK2POg79IK/abBjcZjJQ8F8jPbOss
         +3COdDBr1XTBA2HUyjg4lDD8OJ3Ehs6wY102ivPqngYyKazHPUwlPSJhG6hAc4lymVOD
         5xtF1UGREGhM7UkB8gENr4ZR+GGm4lLh+JKx0xzatBiRgS+OaEFjBltIHlmqiL7ByQjA
         /BirgXngUTcJPGF+sLtl97XySHfaa08KfbaTslnCjQAVGUWVCHLZBnfpqR0BW8TV2u2G
         kYW4ivmLOnQ9fX2HtOC3Bcuudqt3AAv3NV4r3ErzR0aFBM5LqEV8LsyUfIqKufCuQnlK
         6pTw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w1-20020a81d101000000b005d81103cb1fsi178219ywi.503.2023.12.07.13.22.50
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:50 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-nSkNAEUfMV-Y-V7MdrNT2g-1; Thu,
 07 Dec 2023 16:22:48 -0500
X-MC-Unique: nSkNAEUfMV-Y-V7MdrNT2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2903813BC8
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8880E1C05E1A; Thu,  7 Dec 2023 21:22:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD9541C060AF;
	Thu,  7 Dec 2023 21:22:45 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/59] netfs: Implement unbuffered/DIO vs buffered I/O locking
Date: Thu,  7 Dec 2023 21:21:18 +0000
Message-ID: <20231207212206.1379128-12-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Borrow NFS's direct-vs-buffered I/O locking into netfslib.  Similar code is
also used in ceph.

Modify it to have the correct checker annotations for i_rwsem lock
acquisition/release and to return -ERESTARTSYS if waits are interrupted.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/Makefile     |   1 +
 fs/netfs/locking.c    | 215 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  10 ++
 3 files changed, 226 insertions(+)
 create mode 100644 fs/netfs/locking.c

diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index a84fe9bbd3c4..cf3fc847b8ac 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -4,6 +4,7 @@ netfs-y := \
 	buffered_read.o \
 	io.o \
 	iterator.o \
+	locking.o \
 	main.o \
 	misc.o \
 	objects.o
diff --git a/fs/netfs/locking.c b/fs/netfs/locking.c
new file mode 100644
index 000000000000..58e0f48394c5
--- /dev/null
+++ b/fs/netfs/locking.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I/O and data path helper functionality.
+ *
+ * Borrowed from NFS Copyright (c) 2016 Trond Myklebust
+ */
+
+#include <linux/kernel.h>
+#include <linux/netfs.h>
+
+/*
+ * inode_dio_wait_interruptible - wait for outstanding DIO requests to finish
+ * @inode: inode to wait for
+ *
+ * Waits for all pending direct I/O requests to finish so that we can
+ * proceed with a truncate or equivalent operation.
+ *
+ * Must be called under a lock that serializes taking new references
+ * to i_dio_count, usually by inode->i_mutex.
+ */
+static int inode_dio_wait_interruptible(struct inode *inode)
+{
+	if (!atomic_read(&inode->i_dio_count))
+		return 0;
+
+	wait_queue_head_t *wq = bit_waitqueue(&inode->i_state, __I_DIO_WAKEUP);
+	DEFINE_WAIT_BIT(q, &inode->i_state, __I_DIO_WAKEUP);
+
+	for (;;) {
+		prepare_to_wait(wq, &q.wq_entry, TASK_INTERRUPTIBLE);
+		if (!atomic_read(&inode->i_dio_count))
+			break;
+		if (signal_pending(current))
+			break;
+		schedule();
+	}
+	finish_wait(wq, &q.wq_entry);
+
+	return atomic_read(&inode->i_dio_count) ? -ERESTARTSYS : 0;
+}
+
+/* Call with exclusively locked inode->i_rwsem */
+static int netfs_block_o_direct(struct netfs_inode *ictx)
+{
+	if (!test_bit(NETFS_ICTX_ODIRECT, &ictx->flags))
+		return 0;
+	clear_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
+	return inode_dio_wait_interruptible(&ictx->inode);
+}
+
+/**
+ * netfs_start_io_read - declare the file is being used for buffered reads
+ * @inode: file inode
+ *
+ * Declare that a buffered read operation is about to start, and ensure
+ * that we block all direct I/O.
+ * On exit, the function ensures that the NETFS_ICTX_ODIRECT flag is unset,
+ * and holds a shared lock on inode->i_rwsem to ensure that the flag
+ * cannot be changed.
+ * In practice, this means that buffered read operations are allowed to
+ * execute in parallel, thanks to the shared lock, whereas direct I/O
+ * operations need to wait to grab an exclusive lock in order to set
+ * NETFS_ICTX_ODIRECT.
+ * Note that buffered writes and truncates both take a write lock on
+ * inode->i_rwsem, meaning that those are serialised w.r.t. the reads.
+ */
+int netfs_start_io_read(struct inode *inode)
+	__acquires(inode->i_rwsem)
+{
+	struct netfs_inode *ictx = netfs_inode(inode);
+
+	/* Be an optimist! */
+	if (down_read_interruptible(&inode->i_rwsem) < 0)
+		return -ERESTARTSYS;
+	if (test_bit(NETFS_ICTX_ODIRECT, &ictx->flags) == 0)
+		return 0;
+	up_read(&inode->i_rwsem);
+
+	/* Slow path.... */
+	if (down_write_killable(&inode->i_rwsem) < 0)
+		return -ERESTARTSYS;
+	if (netfs_block_o_direct(ictx) < 0) {
+		up_write(&inode->i_rwsem);
+		return -ERESTARTSYS;
+	}
+	downgrade_write(&inode->i_rwsem);
+	return 0;
+}
+EXPORT_SYMBOL(netfs_start_io_read);
+
+/**
+ * netfs_end_io_read - declare that the buffered read operation is done
+ * @inode: file inode
+ *
+ * Declare that a buffered read operation is done, and release the shared
+ * lock on inode->i_rwsem.
+ */
+void netfs_end_io_read(struct inode *inode)
+	__releases(inode->i_rwsem)
+{
+	up_read(&inode->i_rwsem);
+}
+EXPORT_SYMBOL(netfs_end_io_read);
+
+/**
+ * netfs_start_io_write - declare the file is being used for buffered writes
+ * @inode: file inode
+ *
+ * Declare that a buffered read operation is about to start, and ensure
+ * that we block all direct I/O.
+ */
+int netfs_start_io_write(struct inode *inode)
+	__acquires(inode->i_rwsem)
+{
+	struct netfs_inode *ictx = netfs_inode(inode);
+
+	if (down_write_killable(&inode->i_rwsem) < 0)
+		return -ERESTARTSYS;
+	if (netfs_block_o_direct(ictx) < 0) {
+		up_write(&inode->i_rwsem);
+		return -ERESTARTSYS;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(netfs_start_io_write);
+
+/**
+ * netfs_end_io_write - declare that the buffered write operation is done
+ * @inode: file inode
+ *
+ * Declare that a buffered write operation is done, and release the
+ * lock on inode->i_rwsem.
+ */
+void netfs_end_io_write(struct inode *inode)
+	__releases(inode->i_rwsem)
+{
+	up_write(&inode->i_rwsem);
+}
+EXPORT_SYMBOL(netfs_end_io_write);
+
+/* Call with exclusively locked inode->i_rwsem */
+static int netfs_block_buffered(struct inode *inode)
+{
+	struct netfs_inode *ictx = netfs_inode(inode);
+	int ret;
+
+	if (!test_bit(NETFS_ICTX_ODIRECT, &ictx->flags)) {
+		set_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
+		if (inode->i_mapping->nrpages != 0) {
+			unmap_mapping_range(inode->i_mapping, 0, 0, 0);
+			ret = filemap_fdatawait(inode->i_mapping);
+			if (ret < 0) {
+				clear_bit(NETFS_ICTX_ODIRECT, &ictx->flags);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+/**
+ * netfs_start_io_direct - declare the file is being used for direct i/o
+ * @inode: file inode
+ *
+ * Declare that a direct I/O operation is about to start, and ensure
+ * that we block all buffered I/O.
+ * On exit, the function ensures that the NETFS_ICTX_ODIRECT flag is set,
+ * and holds a shared lock on inode->i_rwsem to ensure that the flag
+ * cannot be changed.
+ * In practice, this means that direct I/O operations are allowed to
+ * execute in parallel, thanks to the shared lock, whereas buffered I/O
+ * operations need to wait to grab an exclusive lock in order to clear
+ * NETFS_ICTX_ODIRECT.
+ * Note that buffered writes and truncates both take a write lock on
+ * inode->i_rwsem, meaning that those are serialised w.r.t. O_DIRECT.
+ */
+int netfs_start_io_direct(struct inode *inode)
+	__acquires(inode->i_rwsem)
+{
+	struct netfs_inode *ictx = netfs_inode(inode);
+	int ret;
+
+	/* Be an optimist! */
+	if (down_read_interruptible(&inode->i_rwsem) < 0)
+		return -ERESTARTSYS;
+	if (test_bit(NETFS_ICTX_ODIRECT, &ictx->flags) != 0)
+		return 0;
+	up_read(&inode->i_rwsem);
+
+	/* Slow path.... */
+	if (down_write_killable(&inode->i_rwsem) < 0)
+		return -ERESTARTSYS;
+	ret = netfs_block_buffered(inode);
+	if (ret < 0) {
+		up_write(&inode->i_rwsem);
+		return ret;
+	}
+	downgrade_write(&inode->i_rwsem);
+	return 0;
+}
+EXPORT_SYMBOL(netfs_start_io_direct);
+
+/**
+ * netfs_end_io_direct - declare that the direct i/o operation is done
+ * @inode: file inode
+ *
+ * Declare that a direct I/O operation is done, and release the shared
+ * lock on inode->i_rwsem.
+ */
+void netfs_end_io_direct(struct inode *inode)
+	__releases(inode->i_rwsem)
+{
+	up_read(&inode->i_rwsem);
+}
+EXPORT_SYMBOL(netfs_end_io_direct);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 8efbfd3b2820..fc6d9756a029 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -129,6 +129,8 @@ struct netfs_inode {
 	struct fscache_cookie	*cache;
 #endif
 	loff_t			remote_i_size;	/* Size of the remote file */
+	unsigned long		flags;
+#define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 };
 
 /*
@@ -310,6 +312,13 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);
 
+int netfs_start_io_read(struct inode *inode);
+void netfs_end_io_read(struct inode *inode);
+int netfs_start_io_write(struct inode *inode);
+void netfs_end_io_write(struct inode *inode);
+int netfs_start_io_direct(struct inode *inode);
+void netfs_end_io_direct(struct inode *inode);
+
 /**
  * netfs_inode - Get the netfs inode context from the inode
  * @inode: The inode to query
@@ -335,6 +344,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 {
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
+	ctx->flags = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

