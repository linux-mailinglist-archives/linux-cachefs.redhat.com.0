Return-Path: <linux-cachefs+bncBDLIXLMFVAERBN5ZS2YAMGQEYGVV4PY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id B27A2890574
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:37:12 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69057317d23sf15925266d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:37:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643831; cv=pass;
        d=google.com; s=arc-20160816;
        b=hrOa44N/tNkflHM7SzX/XomkyGXPTTFdIA4Ht4t/zr8brSJbiZigYmC3A8KmvydmpP
         m29I7A+2WTdh+DCkByjtgoT7pOQANHD46qOzi/sPdgO6F/if8ykwUP1y10iQX8oRpONv
         JCVUw3+MXuR2GLGwFOkoY4fI7cP1v49x1OsDDLRnrURZyHUbFPTO+EFnf9HGgNy8SDY+
         uZXxjwEctwPv7VITyNhb/rUvtxgI2TwJcgbT+Po/Pd97lR0s3zq+wJdzym1afVlFoCK9
         lbgZm1Sm9SkqUYfoshR/cmf86n6GR8Duy3+FflpfnFqY8/rLzBB/UeQ0X1/h1QnVICwj
         oaPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=QImpUW4uSjrJC/obL44ceDT6GISw2Lz9XA9oAiKmryU=;
        fh=mTUwRxvR/YdUQ7isCuPnJD30UL069LAvlp/vo+6ziwU=;
        b=e2IgQQSq92FBQKU9OXD8GyiuynQq9eL8CpJd7BdWmfjhILA2onkSqCUhO4zMUI0b/N
         oRi49NlTOle2e+xjgcLYUs+3mjn2IrfePl3nTeoZacbZAHwNvd0ndYQoc+4oTE3LFB70
         SEIVORI+UmqY2c5XuuY1tNNRJQ2HSgDQ1Q0y1jYkIHy63vKw3NGaodmuY+Yh+BU85brz
         FClXK1I7JdJy5cS5EodDAb0JEYEOWru9St5g978D0iu5L5qc15/Aajd8+fyUXwvt7ht9
         /+NnUgeFF1RWiBswkPKF00GvTR/pXVNFVyW9mdZX0s+nu7nnI2g5N8KkBr5fCgtHad8y
         lXlQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643831; x=1712248631;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QImpUW4uSjrJC/obL44ceDT6GISw2Lz9XA9oAiKmryU=;
        b=vJNEjl0EzT3p30XP/jZv7R9ztwV8mEFYsPCIX4LPOK7vy0MbHB/kAbT9w5DSEolYgB
         3L5gcYKoG9qhtininAuaOo/Mqc4K4WTs8ZXVTY9J8keIJfjQY2IEoBHzyY9IsJ+sE8T2
         z8onLd3R+sNS5aaVml/0Wq542wMQXucKeZlh8o2dHO2fks3Phkfym/LI54om3zBaTSWy
         5O3sEXWIWNsAtULmfVIUftByHtt7wUGWkWiY0iSX5hrpaow8PW0GqZrSYStYy1kB9KM4
         F9BDhuoWejw9t2Z4ukfXN0TA3dmeKkmM3HVGVWlaS746VHDvKfIiXZB3riNS3KP7Dhlz
         a6kw==
X-Forwarded-Encrypted: i=2; AJvYcCWtyaxpGSEBHGGSUXB1EeKoBM5DpT+StNd8dS54qy8ucQ9d3jsfSJ/DC0Pu68LPdfNgggMxU+cCvBmqz+PoHna/A7rV+p7ENmhgzRU=
X-Gm-Message-State: AOJu0YyZ2nbAdgAn9L/XUwc3OUlBtj9IswPRGrm0cKgwG64vNLY/ghKu
	uVrxJsNfqkuDfrpztt6xubBq483vJsUDeedAXoPWaNIRWoM9pjS7pBKAGGlN5sE=
X-Google-Smtp-Source: AGHT+IGtLTrmCnIebCWQlqXhN2hq/rBhJMI58chc+EKOawpdG/pUxtZ3KbPA446i3iGPbTFlxBjVWw==
X-Received: by 2002:a0c:e801:0:b0:696:a539:8852 with SMTP id y1-20020a0ce801000000b00696a5398852mr2925924qvn.64.1711643831750;
        Thu, 28 Mar 2024 09:37:11 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1d03:b0:698:ecf4:6ea5 with SMTP id
 e3-20020a0562141d0300b00698ecf46ea5ls22095qvd.2.-pod-prod-06-us; Thu, 28 Mar
 2024 09:37:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm5kPo8RnROBl8TijAAZw8VDCLtUiJuYAgy8AoNPYI1DLmw2a6IvT+RsPJhquKoifmMe7FeiyilfMoyX5r+FQchhKZQM/MnU5TRJ+vPls=
X-Received: by 2002:a05:6214:17c2:b0:696:4084:d6f6 with SMTP id cu2-20020a05621417c200b006964084d6f6mr3601391qvb.8.1711643831101;
        Thu, 28 Mar 2024 09:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643831; cv=none;
        d=google.com; s=arc-20160816;
        b=g3Vlz5+5KGmWerPjMgJI1zhviJF/Tqqs+cN/NXnrLRLXLy5tTiEVz3IJ8EVIEal++0
         5jHg/LBmsxBa+9Y89/ZPSKsh0UY9L4ePahsD1vK0HAf4v7W1+YwIjimlyl52A+Il8xS7
         95VFfV+ybN/P+zs/PHWo+I0ygW9G3sVzHOrBH41e+xWPWKzoZYyHSRNxQvZf9tSKrtcZ
         FqFoDViX2RYMshft7mlOCyAiE2Odthtpn/ZPMGMMyl7nZS0KQSPp4aw4g332QpG6e7Br
         8dgsCslWVd6Tpd+C3tavubHUiqi9E1XUUUcrv0LYxIB/DJ9pK6UwHNM9vD4TDMWOpPQ0
         2rSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ynxqw2O6Fn8BCqwyUG55TcbJftNzL16LOIMZCwa+6jc=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=apTHAeSZMijmz3Y5hl9E8oEIXtrfdBJodL7YZqduP6+CwG52bWfe3CA7Iz8+PDOUJm
         ivTJL0CWL8pPd9W3U6FbVRYwtp9UU3E8dEfu6W2fLocwU8Sr1tyhdyz9VM1tqjh8fCsJ
         x5gPeLH3clXOrQZmOGNBHgwqt5QXygIYUz/VTTlQCDQm/kJRcztiiyCP1MEKzFcISVps
         YCCocmscNiV9ZgiHz1CpXKQ8xPQ2Tzf8LNBuScswoDyOFBPUnSk8URZDgVip0n6fBI+G
         GWr5Y/ED7VOjrlQ7aU6Q3n3bKJBjY6VZLJBuLvkvfojxTkAyF3QjvCCE7HrSczsWDNBl
         +wOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y11-20020a0cec0b000000b00690c80b5da4si1766894qvo.140.2024.03.28.09.37.10
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-mefLnYAiOFeSpn0bNluT-w-1; Thu,
 28 Mar 2024 12:37:08 -0400
X-MC-Unique: mefLnYAiOFeSpn0bNluT-w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20E6383CD77
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:37:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DE98B492BDB; Thu, 28 Mar 2024 16:37:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB8F0492BD0;
	Thu, 28 Mar 2024 16:37:03 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/26] afs: Use alternative invalidation to using launder_folio
Date: Thu, 28 Mar 2024 16:34:04 +0000
Message-ID: <20240328163424.2781320-13-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Use writepages-based flushing invalidation instead of
invalidate_inode_pages2() and ->launder_folio().  This will allow
->launder_folio() to be removed eventually.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/afs/file.c       |  1 -
 fs/afs/internal.h   |  1 -
 fs/afs/validation.c |  4 ++--
 fs/afs/write.c      | 10 +++-------
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index ef2cc8f565d2..dfd8f60f5e1f 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -54,7 +54,6 @@ const struct address_space_operations afs_file_aops = {
 	.read_folio	= netfs_read_folio,
 	.readahead	= netfs_readahead,
 	.dirty_folio	= netfs_dirty_folio,
-	.launder_folio	= netfs_launder_folio,
 	.release_folio	= netfs_release_folio,
 	.invalidate_folio = netfs_invalidate_folio,
 	.migrate_folio	= filemap_migrate_folio,
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 6ce5a612937c..b93aa026daa4 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -916,7 +916,6 @@ struct afs_operation {
 			loff_t	pos;
 			loff_t	size;
 			loff_t	i_size;
-			bool	laundering;	/* Laundering page, PG_writeback not set */
 		} store;
 		struct {
 			struct iattr	*attr;
diff --git a/fs/afs/validation.c b/fs/afs/validation.c
index 32a53fc8dfb2..1d8bbc46f734 100644
--- a/fs/afs/validation.c
+++ b/fs/afs/validation.c
@@ -365,9 +365,9 @@ static void afs_zap_data(struct afs_vnode *vnode)
 	 * written back in a regular file and completely discard the pages in a
 	 * directory or symlink */
 	if (S_ISREG(vnode->netfs.inode.i_mode))
-		invalidate_remote_inode(&vnode->netfs.inode);
+		filemap_invalidate_inode(&vnode->netfs.inode, true);
 	else
-		invalidate_inode_pages2(vnode->netfs.inode.i_mapping);
+		filemap_invalidate_inode(&vnode->netfs.inode, false);
 }
 
 /*
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 74402d95a884..1bc26466eb72 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -75,8 +75,7 @@ static void afs_store_data_success(struct afs_operation *op)
 	op->ctime = op->file[0].scb.status.mtime_client;
 	afs_vnode_commit_status(op, &op->file[0]);
 	if (!afs_op_error(op)) {
-		if (!op->store.laundering)
-			afs_pages_written_back(vnode, op->store.pos, op->store.size);
+		afs_pages_written_back(vnode, op->store.pos, op->store.size);
 		afs_stat_v(vnode, n_stores);
 		atomic_long_add(op->store.size, &afs_v2net(vnode)->n_store_bytes);
 	}
@@ -91,8 +90,7 @@ static const struct afs_operation_ops afs_store_data_operation = {
 /*
  * write to a file
  */
-static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos,
-			  bool laundering)
+static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos)
 {
 	struct afs_operation *op;
 	struct afs_wb_key *wbk = NULL;
@@ -123,7 +121,6 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
 	op->file[0].modification = true;
 	op->store.pos = pos;
 	op->store.size = size;
-	op->store.laundering = laundering;
 	op->flags |= AFS_OPERATION_UNINTR;
 	op->ops = &afs_store_data_operation;
 
@@ -168,8 +165,7 @@ static void afs_upload_to_server(struct netfs_io_subrequest *subreq)
 	       subreq->rreq->debug_id, subreq->debug_index, subreq->io_iter.count);
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
-	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start,
-			     subreq->rreq->origin == NETFS_LAUNDER_WRITE);
+	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start);
 	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len,
 					  false);
 }

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

