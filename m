Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKXZSCWAMGQELRL3KPI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E6D81B75C
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:59 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425a238106asf2180651cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165098; cv=pass;
        d=google.com; s=arc-20160816;
        b=DaQeCIL8CDE6/umvyBqh+vkpsaHq1oryUqLWSgNNI48+BxqkvH4muk5ls15pbXcom4
         +UMQeYu5q24/STPwJR12TH8cChoH29IyyiIpZydGYJ9PAzuFU36dNyFMmkoSadDRB+vM
         3H3Rw1iqdab4ryCq+ObK/PRSCTvPetL1iNqWwtVRWGwHR7jzHHA3cbYto9mbG5PnFVAj
         zf4CUspWPCpFJVa7gPwZD5xhRqNoQHI+KXkWOTVWWxNI1QgcrdBmpI2AxznCYqn0ougy
         edhn53gC3mmCnCSd3wjb6T/0YmTDVeYix1zIuXSgcHs1tYFQTWBYYCJTTxG2RFbwID21
         Pvpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VDmIjGlF0k+t5bXlgWBKqiT0EzWJziwBClkpS7GjXbQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ewv4jg5yP7GyLuCXANeBolXfBAM+k7XmnjFoRm9ZUvhQrihHXGzILVrdNMMh6VzFf0
         XFJ/+7BC3uwYzr7zEAbqDh1VcyiyzVLw4FkyitG3RkfGO/1RfcqKuw1yzZDxC1jhbUuU
         DbrdfeOnpjg+yy9znIgEXBr1zjThLpQLI2T9xXWi0gfSS6rwKzENC+ZdhOq206M3e1Pu
         bnr6WHWhBPGpVZSDJ6Do7CyzcpTrJL1wEGAlV4MbyX6zwLN0ljIydScfbJoteN0HDemS
         3tF8rLVJ7zplDLJWuWn+UosfrFmWxu5PgTh1tgg2/4oZ0OuRzW0bC4ZE5Fjf7VPvM5rv
         LWRw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165098; x=1703769898;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDmIjGlF0k+t5bXlgWBKqiT0EzWJziwBClkpS7GjXbQ=;
        b=lRIzdLYiPu8q5TQwLhiqDmdeqC3kYrrpVPbS6tPnic5lxVwe1VzbzMr7lAei9BeweR
         Wj9jNl7NO0h3nvrLnv3NsUKGiQLQRDOaA/ImVvCDDgSZbxCnYIhREz1cE+chc9ZfAai6
         SjonZaKEaSFGErvQMz1wHZ9zKph7ZgzEOFNjFuf1h+uYMWuVNL7lePkeRDdcSwfVXJE4
         HDvcm/IsmQhC9RjmkhVGZdfgz9mwXJ5aRtdR9F0qZeWhVvkVoNtlL+7dj9uqL3/Q4CdE
         45XeGzz34dWnD3zdl4vTmOyOv7T/JYJ/53HqIkxVsoqsZ2SMszMjDARekoFBqXksgrg2
         nEcg==
X-Gm-Message-State: AOJu0YwuN8XGnEygKEyTIrqkNPuBZUBNOKODbEkN6YTjoL74EA4GXu0p
	f88NHPSmeuF/wEuF4zKIujrUAg==
X-Google-Smtp-Source: AGHT+IFWKSg897XCueiB1RZadhOqOIAKChc3oGwOV32j1BAWiOaxv3U4ObiZKzuNTRjRPXpg+CxzOA==
X-Received: by 2002:a05:622a:1890:b0:427:9751:959d with SMTP id v16-20020a05622a189000b004279751959dmr2049974qtc.1.1703165098247;
        Thu, 21 Dec 2023 05:24:58 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:6a09:0:b0:427:88a3:a1e4 with SMTP id t9-20020ac86a09000000b0042788a3a1e4ls1218307qtr.1.-pod-prod-06-us;
 Thu, 21 Dec 2023 05:24:57 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:780:deae:3595 with SMTP id i13-20020a05620a404d00b00780deae3595mr9036552qko.94.1703165097567;
        Thu, 21 Dec 2023 05:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165097; cv=none;
        d=google.com; s=arc-20160816;
        b=zWryW4CRX0GPTT3fDAtlEVXayFwB9pvZX2pHq8p3A7ZDG/1NDMi51RWzWpEtPQcoPK
         Fcey0Xa2xx0deeGOQKN5qlph7yDVlcm6SKkobCmYaED87B/btP4lNHGrpTZ9KMkV0mMc
         T70hstaVHI4xKVs7gj8TRb0foxfUPZ8a/CtUjKbxyRcIhl51QRkwXW5QTWk/cdkzqjSs
         bEyd9DwBWSmm+wIfYoprx5+dlnYHoN9QkqJAVi8D8daeM7MLJZ279iJWjR9RLWSGzWTI
         NMLeN7XxNNK3njSahMz7ZAfjRdI+m7awe9o0Q6JVCqySZQzvv6/Rcu1h+M9E0ZTWIFOe
         3tBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=A6Q0Pz3fsuGjrKL6TrCPpr6WGxuw5zdFamiJpqqd90U=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=JbCkjnTXRHRpXaeHdroVsv6G2zYSjKrk0MRWBRzZemsoFhpRrHUPxW+V0971znHrl4
         5HqhCKWTq2QTZHsiqBsWtJYHgzCasWUXO/8uHHoMHsHJHjP2F0NwptwLy4hGC+yrcLt4
         IDlYcB/KtJoUtckyexkUdiiiuzqCxYhFE0jLaxYN3Xw1+42nxo52wnjBGgN88xl/hrQX
         +mIAxx33+XjxB42/6ebdXWypuKvGVKC7KA7legKhXaRP6MvuD1Tv6T1y2JdX0sFoezSE
         YB47cctc3xjGsbn4X/y9GHyEvlnt496jTMeD7ndjwci7l0uB0lVcp7CagQE++KC6MxpG
         bi5w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id c1-20020ae9e201000000b0077424168fa1si2047863qkc.629.2023.12.21.05.24.57
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-1je4jTdFMaeaiq4Pa2pNVw-1; Thu,
 21 Dec 2023 08:24:55 -0500
X-MC-Unique: 1je4jTdFMaeaiq4Pa2pNVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9148E3C000BB
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8B937492BC8; Thu, 21 Dec 2023 13:24:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A510C492BC6;
	Thu, 21 Dec 2023 13:24:52 +0000 (UTC)
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
Subject: [PATCH v5 13/40] netfs: Implement unbuffered/DIO vs buffered I/O locking
Date: Thu, 21 Dec 2023 13:23:08 +0000
Message-ID: <20231221132400.1601991-14-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/Makefile     |   1 +
 fs/netfs/locking.c    | 216 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  10 ++
 3 files changed, 227 insertions(+)
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
index 000000000000..75dc52a49b3a
--- /dev/null
+++ b/fs/netfs/locking.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I/O and data path helper functionality.
+ *
+ * Borrowed from NFS Copyright (c) 2016 Trond Myklebust
+ */
+
+#include <linux/kernel.h>
+#include <linux/netfs.h>
+#include "internal.h"
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

