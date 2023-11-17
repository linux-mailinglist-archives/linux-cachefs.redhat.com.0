Return-Path: <linux-cachefs+bncBDLIXLMFVAERBIFQ36VAMGQEHAEA6WA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C51A7EF963
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:17 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d315cd0e77sf2315240a34.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255776; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ap9CPflbZwzUFdA/m+1uVo+bE+a+PXPvc/MVK101Vye2THCMdJ3nYyAk36Syd5bOKr
         9Ssr3iIqNF7wdw3h4ls3Ow4IU3Zn6wSntGzRS+cG4vsLKddQUlP8OdFfn37cYS90Yla7
         gD6wQ3Bcgg+SYvBsgm/7xRufCKaOcspovrD27j0ptnYa30La0cJLjsybqbrv4bPjds/e
         HY6Q3dBWJrXgH2ICAHL605CjTjC4/2agNy33LqznHS0CwreXUR+ZWBLKML4gOz+lfIQ9
         FifngxQznmkwD9uRMWEx54deSokYkJa79LB8jOsTe4XFRyOKg8hD2+CLUgRgyQgdlhof
         gc7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aA2LUzKyKCO35vM1EfN3RjRvJnHSnQjcMepFd503HXQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=W21/IAR4xYQrGsiNEbQNNc0XvApbDwUKO4iMdCqise1adaMRop9qMjuTLa6dFCl3TU
         4RZ4n4TqGof1leBYStuu/P0Qip2fr1NqpYessIMFWdhahAtX+4lHQFMNt95kSqPX1+8U
         nBm8TnmmT2WW1eblyBPTWTzZ/XUVkeES6KQim6RXazKxRJFD5/U7i4P0IayXvLykeYXn
         e7lNooADlzKa8kp/mjGCu9n4D6FsyTHEnbUO5lDGdiXxyQraKX9YLyDlKfj4mLcbbSyy
         E8/QhtaGMD/uzC5dVwCobe0b06XvbQai4LtgjBI6mGoL7lygaf1we5GVPTnJA/8Yn0W0
         QbyA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255776; x=1700860576;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA2LUzKyKCO35vM1EfN3RjRvJnHSnQjcMepFd503HXQ=;
        b=hHb/cvM7G9VhJRqeIxkY8WndvLi0UnECvVvMSnyqWXiimlNTc78UyAPnagYBxBpmlZ
         3At8Yi8U0zsqoFs+6kTPYUYhjHlgENSIzwX17gUXd6niHtS9s5puN9ObZ2HI/Hld/M93
         KnBgLabr4zJnYL5fhigWGSheien9ARwZ7RQ6ozaA4AckedudhiG4vuBVKdCxiabrJrHW
         URcR4JqARDireABUbjhlMAXOh1OVk/TURntnSfFezlCaff0GGCJ8lWifCmVPLJuAXwne
         o65rWJdgwJ4cQH3XDd/S+pVX8Rkx/Wq+cP+uHFEWny3w/tgHtel5hA+NbgQEsgPf0/Bd
         ws9w==
X-Gm-Message-State: AOJu0YyQRiVdwszmthzjoqvSUpq+3wv3sfjRS7dqwofZLTlH6SUxTkW7
	B4AjaKe2SGzo5nz+XrbGKY+htA==
X-Google-Smtp-Source: AGHT+IFuFIm6XpGMlOVLkuJHwtRtITGPQz666se+NyThtToWlX1MGMTR1uO3gfrEYDODWz7RSlxoJg==
X-Received: by 2002:a05:6830:6b8e:b0:6d3:1982:6f49 with SMTP id dd14-20020a0568306b8e00b006d319826f49mr394460otb.6.1700255776275;
        Fri, 17 Nov 2023 13:16:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e787:0:b0:677:e7da:9886 with SMTP id x7-20020a0ce787000000b00677e7da9886ls669320qvn.2.-pod-prod-05-us;
 Fri, 17 Nov 2023 13:16:15 -0800 (PST)
X-Received: by 2002:a05:6214:c83:b0:66d:139f:34cd with SMTP id r3-20020a0562140c8300b0066d139f34cdmr440760qvr.13.1700255775581;
        Fri, 17 Nov 2023 13:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255775; cv=none;
        d=google.com; s=arc-20160816;
        b=nNJFwZXlZx5fDe8LC/08OMv2ZirG7hZREvaA8fEf+V7psnqq/UxpyaR4KKduFQsESa
         dlHq+2fifDGbwYDJlNCPVsvSvF4+cPEi58jMpcEkeMr9qeIDLQyB1banHnCJ+AikhYA5
         OGOsh7wjeaInJ+c48OzUruJXKZIrSnI1qYbVn0MrPZBh1dllZLYnxhI/5XqMUEUP4gpL
         p/kCtJLWAwEiaS2DFGgGtVIWcntuCiKYhlh4MtjKBWLcL08/FeYkXt6Gmd0j2jjrFjqk
         ymDdGt0NQmfBYKtyE3s7XttRoc+eN3qX5CWTFkTbaNpCcpwnEMJlj/llTuXgHoJp2o37
         mJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=sDuRQ8qt5BAHVjo78hLbEI2A9+TTuLpwEa7n+hIfUok=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=C0pUnff1oyHJs8yQcDNVoRPQCGL5p7LHvVIMRtOJChM+Jv20A/49Q4J8o9RC+Q7z7r
         bJN6isk5RaG975wO7wlHC9eTSyJDKDvRvYrP+IWyw9NiyqUDCSDlMaVEzetYXI9l7g5k
         PvbrBIJudIGJs9pl2ctFRxK8UTZekhzm1pAihfrFx224NNIGgnHjc1NTOYAogthlvjdF
         CE88TxX08E4mPa2PU14Jj49JGL5y6JVtEPOViMiO42NdgJLDnXYHMvwpW2BhzNzL86Kj
         Yz3iFFL8cXG2bgeeKj1vKsrqhkwDPpWTn+lDo5zbSpj1JfDuPJQopm19l8bT65SEVnz3
         Rvhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id a13-20020a05620a066d00b007788fa5ef4fsi2358741qkh.187.2023.11.17.13.16.15
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:15 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-ImSODwzONUixVaH8triLrA-1; Fri, 17 Nov 2023 16:16:13 -0500
X-MC-Unique: ImSODwzONUixVaH8triLrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ABBA101A53B
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 071242166B2B; Fri, 17 Nov 2023 21:16:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 683CE2166B29;
	Fri, 17 Nov 2023 21:16:10 +0000 (UTC)
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
Subject: [PATCH v2 07/51] netfs: Implement unbuffered/DIO vs buffered I/O locking
Date: Fri, 17 Nov 2023 21:14:59 +0000
Message-ID: <20231117211544.1740466-8-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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
index cd22554d9048..647ce1935674 100644
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
index 6e662832c3ae..18e3d8b53646 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -131,6 +131,8 @@ struct netfs_inode {
 	loff_t			remote_i_size;	/* Size of the remote file */
 	loff_t			zero_point;	/* Size after which we assume there's no data
 						 * on the server */
+	unsigned long		flags;
+#define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 };
 
 /*
@@ -312,6 +314,13 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
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
@@ -338,6 +347,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
 	ctx->zero_point = ctx->remote_i_size;
+	ctx->flags = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

