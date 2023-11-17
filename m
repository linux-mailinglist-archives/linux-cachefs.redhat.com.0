Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6NQ36VAMGQEJ3SMC6Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9597EF9B0
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:47 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-677fc5fa42asf5835006d6.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255866; cv=pass;
        d=google.com; s=arc-20160816;
        b=SVt8Xsh4m7Z4YbDU9GgBA0HLNGidbY9rS9IVdylr758U8qixIQPFI/3FNeCcw8Puv7
         Xc9IGKruLYq2CM+1wUaN7s+ZXg8Wd5sreO0g7/TDOTekCxhVBFDjhcC2pRSOGYHYfnKT
         U+0OZ96uCQ5EU+MLfrzJ2XU7gRy/BhaKz5nmEuj2dvrm0EgjkHYtJ1Km2lxD4UxpMktP
         Gkl0WtjoKVz7IWkbbC39xaH7k6kNd9hOg/HcL9wq8eIpF8R2u1m9th7v2Ai9StmV4Ie/
         +wX5NmtlcG3XA1oG7UUctgWW24V0Zz0rj0CE9R+ntW4WcSAZVrxtbeAZRKHm7FkVjaeM
         c2LQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+c97dW5d4lKHH6JVMmFtq9aeIykp6+qet6e0DT4gEdM=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=obUftOIs8dL9WKSs0kWtEdbO7yUvaBT+Op2CypudYhBHBaSEWIHIFCfoZK8Z9D4yqa
         EkKRYsZ6RjlBdl0zPgl0g1VbMlXd0YEGVZSE5fCatucKzHSr+1SHauKufWuRVaDydEKq
         ojyTuOMo1z/WsDkAP4oby3Yl4lgIPSolLdXb40zXk2vm7+XZWIaflSIJrzG7XDYIt2CM
         gte02Onc3r6yH6zPGkAv/hk+guHlaEnJp8bNqXG+kqiL6nDgRDvfLou8LkbfTVKyILLI
         S5fXRokP16cBtnmpMwnjh2hDcAco7oexHmGqM3H6F+GMrnMr76ZEQxFMDr0gZP/mqU6/
         xpQw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255866; x=1700860666;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+c97dW5d4lKHH6JVMmFtq9aeIykp6+qet6e0DT4gEdM=;
        b=ENEd2nMLyAS+ZkHOcP5eW59lsLLfZMH8OTq/yuVYp51EL2W+B/UT1RqFjhxdJ+0qPp
         5ZNjjwnSJjGtFGQXFu9SVaYYxAB2iRsFYz0NiRs07cYRUaw1OTAf7NPo6PU7C7mK4Xcb
         6lr+GTfWLdxVkMfmt2kpHfCpgBXZ8WU5pqy6YsEpa1o/MHhOKayndJBP0t2GKdhW1hlO
         lVOJUE63f0s9sEVv89fpheTiA6gD4jVFnqCd8XPSE1COllRV7TFhiSEq7MFvPkkDsVpL
         claZa2IvmpnGo1b+AFJXd4AFNlOqh6PQVw3uSFS4w/O5jX2TSflxRaoKBn9ocnqSfgGL
         nQXw==
X-Gm-Message-State: AOJu0YxYf36c5PzMRgNP/6u1GbRDv2JGYLL3hlGxYfRKVJhq9SX+T9/u
	SEV/WKydlfniQA3ybxJ+lpqG0g==
X-Google-Smtp-Source: AGHT+IFlvzANiICaLZexRSDJPrwdRo5fUDpaQ4BuvXLpcpEkIrk3OrAwP/1SMyhJe5JkDdoLDFkTRQ==
X-Received: by 2002:a05:6214:e88:b0:671:3f49:c8b2 with SMTP id hf8-20020a0562140e8800b006713f49c8b2mr318143qvb.15.1700255866046;
        Fri, 17 Nov 2023 13:17:46 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:57ca:b0:656:3716:f1e6 with SMTP id
 lw10-20020a05621457ca00b006563716f1e6ls900473qvb.0.-pod-prod-06-us; Fri, 17
 Nov 2023 13:17:45 -0800 (PST)
X-Received: by 2002:ad4:5dc5:0:b0:677:931f:2cc5 with SMTP id m5-20020ad45dc5000000b00677931f2cc5mr274564qvh.5.1700255865589;
        Fri, 17 Nov 2023 13:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255865; cv=none;
        d=google.com; s=arc-20160816;
        b=b8dMvFQyrz4RNlEOlzKoLHAnHzVULI4gXsOtP280MzcZKgXqTkZkm17hgD7veNIbNB
         XxphcNbqxQPFcpKbHWsTs8tBn35qaSZnQBu223qL1Y2Y6wKrPDmz9A6FoBoDAyvFLCdy
         +EI/HgKXNFZszM2VGk1IbZ01QrC0K2MH/j2VT4DjNiseYwJcBCKkx+e80LO2kSi8+Irv
         1d6AV3ZszARnpHUjN9X9g38aB+iPNCpYSbU/E3XLIdVYvcf1NNeDgKOumeXQULHIx/Fr
         z1aI/ZtrPTKHOI8aVxLrBTuF2XxLNGKKzCL1ohxbXGa30Fj3bPE/19lzsakbOpC6s5SH
         SVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=njtooIaoqHtxOz+7Ms2cQooTNH6njUKNcTP7iunfXh8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=vFOKiYHq1epUdcMjp8YZk9JslsmDYQNOyF9P05Aqp1l+9mcBHeOlqqVG6czDVV5O2n
         IjsAiMvw1w8ximQ0zLduRxYubm3eRHZBhEW0TnNoE4d5DzzscsNEyW/J/1UETETaDYLM
         KCVucxfW5fsCi0AWXFiQVhIod8RyqJccDp5Gdzc3pQFicCUFMCnJteNrBTJmkdTZeWCV
         Aiv6J4i87ICxUBMWnnahp/jGxg5nj4qx8HjdjV+Rh7dxLEItOndZTuwSLAYsn+5sfnPy
         Na7J2DUfJS0U2Xxh9ZtjfuNRuzU17CsA42Q3kAxPqr6yht4ldWA+Bw7aie2ZZ1jo9zdN
         ErfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 6-20020ac85946000000b00417eb3b1759si2217367qtz.719.2023.11.17.13.17.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:45 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-8WlHqflEN-6UFOa7NGZ9sw-1; Fri,
 17 Nov 2023 16:17:43 -0500
X-MC-Unique: 8WlHqflEN-6UFOa7NGZ9sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5869228040B4
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 55224C15882; Fri, 17 Nov 2023 21:17:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A789DC15881;
	Fri, 17 Nov 2023 21:17:40 +0000 (UTC)
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
Subject: [PATCH v2 28/51] netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()
Date: Fri, 17 Nov 2023 21:15:20 +0000
Message-ID: <20231117211544.1740466-29-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Provide an entry point to delegate a filesystem's ->page_mkwrite() to.
This checks for conflicting writes, then attached any netfs-specific group
marking (e.g. ceph snap) to the page to be considered dirty.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 59 +++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |  4 +++
 2 files changed, 63 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 60e7da53cbd2..3c1f26f32351 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -413,3 +413,62 @@ ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	return ret;
 }
 EXPORT_SYMBOL(netfs_file_write_iter);
+
+/*
+ * Notification that a previously read-only page is about to become writable.
+ * Note that the caller indicates a single page of a multipage folio.
+ */
+vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group)
+{
+	struct folio *folio = page_folio(vmf->page);
+	struct file *file = vmf->vma->vm_file;
+	struct inode *inode = file_inode(file);
+	vm_fault_t ret = VM_FAULT_RETRY;
+	int err;
+
+	_enter("%lx", folio->index);
+
+	sb_start_pagefault(inode->i_sb);
+
+	if (folio_wait_writeback_killable(folio))
+		goto out;
+
+	if (folio_lock_killable(folio) < 0)
+		goto out;
+
+	/* Can we see a streaming write here? */
+	if (WARN_ON(!folio_test_uptodate(folio))) {
+		ret = VM_FAULT_SIGBUS | VM_FAULT_LOCKED;
+		goto out;
+	}
+
+	if (netfs_folio_group(folio) != netfs_group) {
+		folio_unlock(folio);
+		err = filemap_fdatawait_range(inode->i_mapping,
+					      folio_pos(folio),
+					      folio_pos(folio) + folio_size(folio));
+		switch (err) {
+		case 0:
+			ret = VM_FAULT_RETRY;
+			goto out;
+		case -ENOMEM:
+			ret = VM_FAULT_OOM;
+			goto out;
+		default:
+			ret = VM_FAULT_SIGBUS;
+			goto out;
+		}
+	}
+
+	if (folio_test_dirty(folio))
+		trace_netfs_folio(folio, netfs_folio_trace_mkwrite_plus);
+	else
+		trace_netfs_folio(folio, netfs_folio_trace_mkwrite);
+	netfs_set_group(folio, netfs_group);
+	file_update_time(file);
+	ret = VM_FAULT_LOCKED;
+out:
+	sb_end_pagefault(inode->i_sb);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_page_mkwrite);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 4cdadd1ce328..80e48af8b72f 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -404,6 +404,10 @@ int netfs_write_begin(struct netfs_inode *, struct file *,
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 
+/* VMA operations API. */
+vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group);
+
+/* (Sub)request management API. */
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
 			  enum netfs_sreq_ref_trace what);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

