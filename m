Return-Path: <linux-cachefs+bncBDLIXLMFVAERBR7TYOYQMGQEPXXPKDI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BF8B77D9
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:45 +0200 (CEST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6a0a0eb9cd9sf66147916d6.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485704; cv=pass;
        d=google.com; s=arc-20160816;
        b=d2IAL1VJVBbRTZLm477Ue6ipNPSxOWFaxS9HzjhQt2V3cy/tbT3VuHKg6RyvYnUsKg
         bU8wobRW5WIQsFo9D5DuX+69LVUS3VjEaPCcXIuaYhreXm9OCJ4Lc/DLUg6CpruiCEHm
         zLwQmlAq0HsPE3XlUD+XDGO6rkK6/aRiG/oEsNw4+0HTMYPVoR97mctFm11qnfcrpR0w
         xk9/IORLqzuncZj0HAuwAxBf2OKyn7TGqggS/igD8BNHUIRKN8+N92HkVjnKIlLzVJPp
         LCsFGJayfH7z2h6v2B08Kf0iSBBvhKX27mBvrXOVbosdK7uHUPbeGBZp2ppZXplPG/nb
         ISLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=LE2yRkfx8QmX5jww8XgaAZcvqOA9Sq0/rhCvI3FF8Zs=;
        fh=FGgB57BVOTeq5b3Sbtm5x0DsjyQdwb5vr4koda/cUgw=;
        b=WxkoKp5jNinyiXMwTgpaadzaiF6zGL+qsaTa/eZ7iJ6Ehr4Dpq6d3hhGnzcqs0GO4w
         /AbtPMRpWaabgImMcHzB4K//kErq0eoCX5RZdHpgia4/guyPJm+Nd0g07fMCP4Vf31om
         kRIX8nMVatR9STkp5fdt9qKQnOxbDvkKofaPxgTQjcZ4sg93GA3sT313QVw+MbFVTG5D
         seUrIf20VgecoCjeRPkcFsyGomXNI+q93gy4Z1GzfHqrjxB904T9SJ9x1IOM19M+AoJr
         I1B1FXhRplzw22/QGqXP59eGIXLrKKqjhmdBD6WJP3TiEeah5M/tTLd3+80CPDWJvbFJ
         UhxQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485704; x=1715090504;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE2yRkfx8QmX5jww8XgaAZcvqOA9Sq0/rhCvI3FF8Zs=;
        b=sf6wiiw49AOvfe+s8m4W7F4QT28WmYVxwIXd3Jx36DGvFVncrXtOiQt3qIchWfL6Mr
         /e2ikvSSc9pqCcUNnGcKuF0HSp90D7vYJ8l7nmiKxK9tIlaGyvKod8hi3NoQvoQIrfkP
         I7g/YQuQ0jeEYfKGJ/y7I3pepevZVAv0HH7D0ucfs37CSxCUNAk6VyJ1QM4zD3/1QUET
         cPeD33/7nYXPLpKJc/hUrTibjVXYucJWd6OPFgvCvwVHfNMnRm3MRz5nO2j3zSViHuTs
         fQ4R1Vx75WVWzzX+nzQeX+++8hDU7Zk6YwJ/su57xFcsjMkri/j1G7OOKVcnjRPx+u2K
         aZWw==
X-Forwarded-Encrypted: i=2; AJvYcCXQ5RQB7fbC8JvsRJY0T34JBbyU58qzp1pOtb/r/MiOpbgsX89JumnSwGHjAUzLbBlGYk8UzR9YnRbABOJfNR0ss4oap5OrOzk3ACA=
X-Gm-Message-State: AOJu0YyiBu9JIk0Ql8jQdn9lguwmBMo7nkdT9JDZ//CnC97+vIG+M8Z/
	5o5dqqbQzr+QIygludA8YhKLtcsmxC8vPYGfprXQluH2HTJ/YGcd1B5v4dlzt8w=
X-Google-Smtp-Source: AGHT+IH3l9XQQnGE6Bno781TjOOyOKIa9Edx9nXTDIKCVdyYXIx42J/aRi2vfZgMuluFHCtKpbU12g==
X-Received: by 2002:a05:6214:2687:b0:6a0:cba9:374d with SMTP id gm7-20020a056214268700b006a0cba9374dmr8135506qvb.1.1714485703649;
        Tue, 30 Apr 2024 07:01:43 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:cc7:b0:6a0:e152:6b47 with SMTP id
 6a1803df08f44-6a0e1526cf2ls13954916d6.1.-pod-prod-09-us; Tue, 30 Apr 2024
 07:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCsJT3MbMT8qJ32Zn4NE+llm8XbMW2tENQN3Q8BF+ytEPhwKS+fECKrM4iYrceh7WeodmtGoESSdWOvH8LyBzUZfE8b9t/R00r0wzTjoU=
X-Received: by 2002:a05:6214:19e4:b0:69b:7f0e:bdc with SMTP id q4-20020a05621419e400b0069b7f0e0bdcmr15813330qvc.30.1714485702761;
        Tue, 30 Apr 2024 07:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485702; cv=none;
        d=google.com; s=arc-20160816;
        b=eBwxvONlRT61/wrN+LMo/9Bg2GV5lg8MoA8UsFMMhJuyRwa5zSTCH2w7/sleBgZqO4
         HNJa0EVaUrDna1hZsh98XEbALnRxjKwj0h/RDdv6YHZFlPz5aZK67PjRYcqOq95js8rT
         Kg6nHNw+4qAenLyM+aiyxlm4aLzsFNjiteVAIvTYB2ufSQ7xc9PhaGjrWQeWbMFKpu/f
         2YlD2FiPlxyb+PIxuZ2wHVgWx4127Huavtzz0mRGkS3IoAaLzc/90cfon7vzKv36I8pE
         9g1DWt9iCQ4lXiT4Yw7lSSgO5cZx4hnYVM6NUGcfHz7vFa5uGv/kdwqh04zjCUmikIyT
         SbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=H9oW2wSGzdlNxSrhNqwjbv4gFKpPPpe3xHOvb2Tj7Zw=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=HuyRyfVq3LmT9oxQVsMm29DRHoGbQ77HMIGY9CHsVi5uzyPCictchsjX7xjoAZUJUj
         TDI3mcPIBd3LWbC5felCxPCBtu9EtfVu7Oo5MQ+G0r7iVIrYzj6/5Z+e7Q5miVexd0+v
         IdvqIHfDTa0aXf44LAfbn7fSvp4tTLb1M+mPrvlqUO+tMYQjLPaGTLSyJPn5994l6vfq
         zPT+6kh/cT3YGDsyJnkzF/VpixN2536BA2lEDZtVHFAH4FQm/+sYHCg6E5j6ysQch5o4
         xj9JEXQTwF5YpStfrlPvxTiXgHwn+iHnT6OLbphLIGGyiw5clWz71KRMvKrMGZ5k7z2X
         XViw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fn7-20020ad45d67000000b006a0cd406409si4934154qvb.130.2024.04.30.07.01.42
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-IviNKmAFPT6_Cag9S8qE-A-1; Tue,
 30 Apr 2024 10:01:40 -0400
X-MC-Unique: IviNKmAFPT6_Cag9S8qE-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96BA13819C65
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8FC3D2166B36; Tue, 30 Apr 2024 14:01:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 549752166B31;
	Tue, 30 Apr 2024 14:01:37 +0000 (UTC)
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
Subject: [PATCH v2 09/22] afs: Use alternative invalidation to using launder_folio
Date: Tue, 30 Apr 2024 15:00:40 +0100
Message-ID: <20240430140056.261997-10-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
index 32a53fc8dfb2..bef8af12ebe2 100644
--- a/fs/afs/validation.c
+++ b/fs/afs/validation.c
@@ -365,9 +365,9 @@ static void afs_zap_data(struct afs_vnode *vnode)
 	 * written back in a regular file and completely discard the pages in a
 	 * directory or symlink */
 	if (S_ISREG(vnode->netfs.inode.i_mode))
-		invalidate_remote_inode(&vnode->netfs.inode);
+		filemap_invalidate_inode(&vnode->netfs.inode, true, 0, LLONG_MAX);
 	else
-		invalidate_inode_pages2(vnode->netfs.inode.i_mapping);
+		filemap_invalidate_inode(&vnode->netfs.inode, false, 0, LLONG_MAX);
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

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

