Return-Path: <linux-cachefs+bncBDLIXLMFVAERBIHQZCVQMGQESWM7KHA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E580939A
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:49 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42577ba9d93sf17183411cf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984289; cv=pass;
        d=google.com; s=arc-20160816;
        b=xmC1suUz/mlR+TkPK13h8m7oTwo/M1JTYy6gRI4Y+Yx3Fvss7wn0Bdda+R34uY1RtH
         Z5G2HABe8v3pJD1QZqbleH61mNmJU4witrZSzpdsDTT9pPWwxyxnX3KNUwhd/VRvnZU4
         dt16XLjWmaTz2wD3bK92f8Qr56/yphkQUoN5vQ9u5C+NLHu5/xFUROrk+oUTBJIoY5/R
         Y1/1VwM2lEXCQO5BQeSa8KW995H2O+Ysv1TGByKbAfY+dj37TeZ3+t7miY/Dl6qClNVL
         vFJ+vSMNBf452sXLy+duoApOoCqAvgjMqohk57C11sSe4dRD/rznP7Bp60Y1E129UJYb
         Wb9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=654s2KLzOWtRD614/XFW/Bhg7yrdF30eYL++CW7T0HU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WyhuXK7IA+9Rxt/9ArYDAEMLYZWLzPhVyGH7ultOP0r7QRh09wCxc4rCnUjJnzISUn
         rmJ0cMJX9PTL54Vr1oDu3WQPpUyDZL5bpWXsVcvnOLmAEsjAk4at08nFB6k+3ARwQ0wL
         jgAPAPoas6IlIyWPnttOgrGDc7NRfFSXVyyMhbREjOpjxaGqjnAqZusf0ycKuITFyI6b
         BR7ZILAI6mB/+Mroe0avM+Zcysx6Rhy7FrE8M7G5+4+y4tifJ+XbpPvxxCEAHxebje3S
         nc+klHwXFBmpunZ+P9d4O/aJOwXFz9/mQHEhJFvVhM1XLenghmmM/Y27g7nfjCFlWmZv
         3Z9Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984289; x=1702589089;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=654s2KLzOWtRD614/XFW/Bhg7yrdF30eYL++CW7T0HU=;
        b=DzLIYgAVEEn9Ht3f5ovVFXcWHUse0TX8sgYzGA7ZlYDVoQVIQHNvImQglth0iIvD6w
         ZFEeXYaTYipLTwY34bSck03U0LRNO0P/vK801oNeKAJ/Vbk681Q1ouKHc/x1w75E4dST
         lefMsf8iou3GTWLLns8EYm6qs5DNcNO/WSbP57Vh9qGqpiensU+UQb9s6pTaBYAKjDlx
         VX8J2ITeoDe4D+hhmMfuhmNrinNmlgNZOxhYIvxp3htMNHMra85uC/ii/OwWBL2BS+Vg
         qZGV43GubU35ZXG+VXEy2dA4pFR4ET/I/I1rjPGQLzBxyjQdE7VhF5SsDVmK7javDD/k
         AdgQ==
X-Gm-Message-State: AOJu0Yw8uFB5E2avtr/kesjG4kN3Q8b6j24ucpsdXpjmfvELPy9BVLoT
	ycF7OH7dPdhPwVPVkJIntg7KeA==
X-Google-Smtp-Source: AGHT+IEMINtJ5zVt57VHi2QqHiIpPOOVb58boKFdb9cJybbPFDIb9bG7LGz2RpGdrrJbxwfkdqQ01Q==
X-Received: by 2002:ac8:594c:0:b0:41e:236a:b314 with SMTP id 12-20020ac8594c000000b0041e236ab314mr3967700qtz.68.1701984288809;
        Thu, 07 Dec 2023 13:24:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1812:b0:425:7a00:5857 with SMTP id
 t18-20020a05622a181200b004257a005857ls617313qtc.2.-pod-prod-02-us; Thu, 07
 Dec 2023 13:24:48 -0800 (PST)
X-Received: by 2002:a05:620a:439f:b0:77f:2856:9aa6 with SMTP id a31-20020a05620a439f00b0077f28569aa6mr2103816qkp.53.1701984288213;
        Thu, 07 Dec 2023 13:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984288; cv=none;
        d=google.com; s=arc-20160816;
        b=PAy4Kc5PPtz36RdLM2gwT/WX0kmp6Magsveo3T2I67gj3eJTrbeg7qFNEHs2Ovujo/
         YccrQgHJUTYvUEccXBy6FcThdPHGyiz2PKhS7/YVbIhw301iwKcmfvseSsOpVB5NSnq8
         ohPnkxP2FAiYq6cPIFAzBUxLDzw0Ttbgxmk7JccP/4IVJD2CZCnw5SCtYld+AfOxRwTj
         YyzlJqqodxtHzghe3/cUTnKAHCnVfDIsV04TfhHURUPjstcrE/r8iHN0l5hc8IGPTJkN
         FVcFgq0TE+FI+iTUzoiPJmRcMXVFjjh26718GNiGijxYWGnVo3LYSnXG5REeW6eCGzrX
         6jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ZzLNUoUAJm7NFhvx2e7IUHlwZKeUifG7LRBDIEbXOqs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=DmPJ5aUIUP1d8fDFCkHIZnL5u3H5fYA8eK7W6gbLPX65vkiBFkASVHwwE9gjnlYY9w
         7kaU7EaW4igV/tRgXroa9S7HtgX77eFMwotpbP8EqfnZSn6IFGv/eCsEz9HyiLN6AVDk
         MZ2X/o45VedVBjPFjOMHzt2J9xcVmmV3kIRDe90N1/3mxRNabytbqFx9PyBdZh/xXLNn
         CRlUNw2gmRjeVkvV/CKWQY20Hn+FAoE29j+AO3/BbJz3Hj5kTTbe34++5Pw0xexIluhk
         6GTtKNu4iDZd+PDSeSThduzY+Diyj+jSCMcch1fWaRG6P4+tB3Hc1IuPivmb3pbC2O7g
         PGew==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d1-20020a05620a240100b0077d8fe571f4si612534qkn.547.2023.12.07.13.24.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-AxxH8ep1OXmOAmjr2TIV9g-1; Thu, 07 Dec 2023 16:24:46 -0500
X-MC-Unique: AxxH8ep1OXmOAmjr2TIV9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5684A86C045
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 539F4C185A7; Thu,  7 Dec 2023 21:24:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7BFA0C185A0;
	Thu,  7 Dec 2023 21:24:43 +0000 (UTC)
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
Subject: [PATCH v3 45/59] afs: Use the netfs write helpers
Date: Thu,  7 Dec 2023 21:21:52 +0000
Message-ID: <20231207212206.1379128-46-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Make afs use the netfs write helpers.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/file.c              |  66 +++-
 fs/afs/internal.h          |  10 +-
 fs/afs/write.c             | 705 ++-----------------------------------
 include/trace/events/afs.h |  23 --
 4 files changed, 82 insertions(+), 722 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 3403bb792deb..800cc612c9b2 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -34,7 +34,7 @@ const struct file_operations afs_file_operations = {
 	.release	= afs_release,
 	.llseek		= generic_file_llseek,
 	.read_iter	= afs_file_read_iter,
-	.write_iter	= afs_file_write,
+	.write_iter	= netfs_file_write_iter,
 	.mmap		= afs_file_mmap,
 	.splice_read	= afs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
@@ -50,16 +50,15 @@ const struct inode_operations afs_file_inode_operations = {
 };
 
 const struct address_space_operations afs_file_aops = {
+	.direct_IO	= noop_direct_IO,
 	.read_folio	= netfs_read_folio,
 	.readahead	= netfs_readahead,
 	.dirty_folio	= netfs_dirty_folio,
-	.launder_folio	= afs_launder_folio,
+	.launder_folio	= netfs_launder_folio,
 	.release_folio	= netfs_release_folio,
 	.invalidate_folio = netfs_invalidate_folio,
-	.write_begin	= afs_write_begin,
-	.write_end	= afs_write_end,
-	.writepages	= afs_writepages,
 	.migrate_folio	= filemap_migrate_folio,
+	.writepages	= afs_writepages,
 };
 
 const struct address_space_operations afs_symlink_aops = {
@@ -355,7 +354,10 @@ static int afs_symlink_read_folio(struct file *file, struct folio *folio)
 
 static int afs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
-	rreq->netfs_priv = key_get(afs_file_key(file));
+	if (file)
+		rreq->netfs_priv = key_get(afs_file_key(file));
+	rreq->rsize = 256 * 1024;
+	rreq->wsize = 256 * 1024;
 	return 0;
 }
 
@@ -372,11 +374,36 @@ static void afs_free_request(struct netfs_io_request *rreq)
 	key_put(rreq->netfs_priv);
 }
 
+static void afs_update_i_size(struct inode *inode, loff_t new_i_size)
+{
+	struct afs_vnode *vnode = AFS_FS_I(inode);
+	loff_t i_size;
+
+	write_seqlock(&vnode->cb_lock);
+	i_size = i_size_read(&vnode->netfs.inode);
+	if (new_i_size > i_size) {
+		i_size_write(&vnode->netfs.inode, new_i_size);
+		inode_set_bytes(&vnode->netfs.inode, new_i_size);
+	}
+	write_sequnlock(&vnode->cb_lock);
+	fscache_update_cookie(afs_vnode_cache(vnode), NULL, &new_i_size);
+}
+
+static void afs_netfs_invalidate_cache(struct netfs_io_request *wreq)
+{
+	struct afs_vnode *vnode = AFS_FS_I(wreq->inode);
+
+	afs_invalidate_cache(vnode, 0);
+}
+
 const struct netfs_request_ops afs_req_ops = {
 	.init_request		= afs_init_request,
 	.free_request		= afs_free_request,
 	.check_write_begin	= afs_check_write_begin,
 	.issue_read		= afs_issue_read,
+	.update_i_size		= afs_update_i_size,
+	.invalidate_cache	= afs_netfs_invalidate_cache,
+	.create_write_requests	= afs_create_write_requests,
 };
 
 static void afs_add_open_mmap(struct afs_vnode *vnode)
@@ -445,28 +472,39 @@ static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pg
 
 static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(iocb->ki_filp));
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_file *af = iocb->ki_filp->private_data;
 	int ret;
 
-	ret = afs_validate(vnode, af->key);
+	if (iocb->ki_flags & IOCB_DIRECT)
+		return netfs_unbuffered_read_iter(iocb, iter);
+
+	ret = netfs_start_io_read(inode);
 	if (ret < 0)
 		return ret;
-
-	return generic_file_read_iter(iocb, iter);
+	ret = afs_validate(vnode, af->key);
+	if (ret == 0)
+		ret = netfs_file_read_iter(iocb, iter);
+	netfs_end_io_read(inode);
+	return ret;
 }
 
 static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
 				    struct pipe_inode_info *pipe,
 				    size_t len, unsigned int flags)
 {
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(in));
+	struct inode *inode = file_inode(in);
+	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_file *af = in->private_data;
 	int ret;
 
-	ret = afs_validate(vnode, af->key);
+	ret = netfs_start_io_read(inode);
 	if (ret < 0)
 		return ret;
-
-	return filemap_splice_read(in, ppos, pipe, len, flags);
+	ret = afs_validate(vnode, af->key);
+	if (ret == 0)
+		ret = filemap_splice_read(in, ppos, pipe, len, flags);
+	netfs_end_io_read(inode);
+	return ret;
 }
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index ec173e58ddfe..fcbb977d3317 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1463,19 +1463,11 @@ extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 /*
  * write.c
  */
-extern int afs_write_begin(struct file *file, struct address_space *mapping,
-			loff_t pos, unsigned len,
-			struct page **pagep, void **fsdata);
-extern int afs_write_end(struct file *file, struct address_space *mapping,
-			loff_t pos, unsigned len, unsigned copied,
-			struct page *page, void *fsdata);
-extern int afs_writepage(struct page *, struct writeback_control *);
 extern int afs_writepages(struct address_space *, struct writeback_control *);
-extern ssize_t afs_file_write(struct kiocb *, struct iov_iter *);
 extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
 extern void afs_prune_wb_keys(struct afs_vnode *);
-int afs_launder_folio(struct folio *);
+void afs_create_write_requests(struct netfs_io_request *wreq, loff_t start, size_t len);
 
 /*
  * xattr.c
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 6aa272acb95c..09b6c0b9a28e 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -12,228 +12,17 @@
 #include <linux/writeback.h>
 #include <linux/pagevec.h>
 #include <linux/netfs.h>
+#include <trace/events/netfs.h>
 #include "internal.h"
 
-static int afs_writepages_region(struct address_space *mapping,
-				 struct writeback_control *wbc,
-				 unsigned long long start,
-				 unsigned long long end, loff_t *_next,
-				 bool max_one_loop);
-
-static void afs_write_to_cache(struct afs_vnode *vnode, loff_t start, size_t len,
-			       loff_t i_size, bool caching);
-
-#ifdef CONFIG_AFS_FSCACHE
-static void afs_folio_start_fscache(bool caching, struct folio *folio)
-{
-	if (caching)
-		folio_start_fscache(folio);
-}
-#else
-static void afs_folio_start_fscache(bool caching, struct folio *folio)
-{
-}
-#endif
-
-/*
- * prepare to perform part of a write to a page
- */
-int afs_write_begin(struct file *file, struct address_space *mapping,
-		    loff_t pos, unsigned len,
-		    struct page **_page, void **fsdata)
-{
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
-	struct folio *folio;
-	int ret;
-
-	_enter("{%llx:%llu},%llx,%x",
-	       vnode->fid.vid, vnode->fid.vnode, pos, len);
-
-	/* Prefetch area to be written into the cache if we're caching this
-	 * file.  We need to do this before we get a lock on the page in case
-	 * there's more than one writer competing for the same cache block.
-	 */
-	ret = netfs_write_begin(&vnode->netfs, file, mapping, pos, len, &folio, fsdata);
-	if (ret < 0)
-		return ret;
-
-try_again:
-	/* See if this page is already partially written in a way that we can
-	 * merge the new write with.
-	 */
-	if (folio_test_writeback(folio)) {
-		trace_afs_folio_dirty(vnode, tracepoint_string("alrdy"), folio);
-		folio_unlock(folio);
-		goto wait_for_writeback;
-	}
-
-	*_page = folio_file_page(folio, pos / PAGE_SIZE);
-	_leave(" = 0");
-	return 0;
-
-wait_for_writeback:
-	ret = folio_wait_writeback_killable(folio);
-	if (ret < 0)
-		goto error;
-
-	ret = folio_lock_killable(folio);
-	if (ret < 0)
-		goto error;
-	goto try_again;
-
-error:
-	folio_put(folio);
-	_leave(" = %d", ret);
-	return ret;
-}
-
-/*
- * finalise part of a write to a page
- */
-int afs_write_end(struct file *file, struct address_space *mapping,
-		  loff_t pos, unsigned len, unsigned copied,
-		  struct page *subpage, void *fsdata)
-{
-	struct folio *folio = page_folio(subpage);
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
-	loff_t i_size, write_end_pos;
-
-	_enter("{%llx:%llu},{%lx}",
-	       vnode->fid.vid, vnode->fid.vnode, folio_index(folio));
-
-	if (!folio_test_uptodate(folio)) {
-		if (copied < len) {
-			copied = 0;
-			goto out;
-		}
-
-		folio_mark_uptodate(folio);
-	}
-
-	if (copied == 0)
-		goto out;
-
-	write_end_pos = pos + copied;
-
-	i_size = i_size_read(&vnode->netfs.inode);
-	if (write_end_pos > i_size) {
-		write_seqlock(&vnode->cb_lock);
-		i_size = i_size_read(&vnode->netfs.inode);
-		if (write_end_pos > i_size)
-			afs_set_i_size(vnode, write_end_pos);
-		write_sequnlock(&vnode->cb_lock);
-		fscache_update_cookie(afs_vnode_cache(vnode), NULL, &write_end_pos);
-	}
-
-	if (folio_mark_dirty(folio))
-		_debug("dirtied %lx", folio_index(folio));
-
-out:
-	folio_unlock(folio);
-	folio_put(folio);
-	return copied;
-}
-
-/*
- * kill all the pages in the given range
- */
-static void afs_kill_pages(struct address_space *mapping,
-			   loff_t start, loff_t len)
-{
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct folio *folio;
-	pgoff_t index = start / PAGE_SIZE;
-	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
-
-	_enter("{%llx:%llu},%llx @%llx",
-	       vnode->fid.vid, vnode->fid.vnode, len, start);
-
-	do {
-		_debug("kill %lx (to %lx)", index, last);
-
-		folio = filemap_get_folio(mapping, index);
-		if (IS_ERR(folio)) {
-			next = index + 1;
-			continue;
-		}
-
-		next = folio_next_index(folio);
-
-		folio_clear_uptodate(folio);
-		folio_end_writeback(folio);
-		folio_lock(folio);
-		generic_error_remove_folio(mapping, folio);
-		folio_unlock(folio);
-		folio_put(folio);
-
-	} while (index = next, index <= last);
-
-	_leave("");
-}
-
-/*
- * Redirty all the pages in a given range.
- */
-static void afs_redirty_pages(struct writeback_control *wbc,
-			      struct address_space *mapping,
-			      loff_t start, loff_t len)
-{
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct folio *folio;
-	pgoff_t index = start / PAGE_SIZE;
-	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
-
-	_enter("{%llx:%llu},%llx @%llx",
-	       vnode->fid.vid, vnode->fid.vnode, len, start);
-
-	do {
-		_debug("redirty %llx @%llx", len, start);
-
-		folio = filemap_get_folio(mapping, index);
-		if (IS_ERR(folio)) {
-			next = index + 1;
-			continue;
-		}
-
-		next = index + folio_nr_pages(folio);
-		folio_redirty_for_writepage(wbc, folio);
-		folio_end_writeback(folio);
-		folio_put(folio);
-	} while (index = next, index <= last);
-
-	_leave("");
-}
-
 /*
  * completion of write to server
  */
 static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsigned int len)
 {
-	struct address_space *mapping = vnode->netfs.inode.i_mapping;
-	struct folio *folio;
-	pgoff_t end;
-
-	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
-
 	_enter("{%llx:%llu},{%x @%llx}",
 	       vnode->fid.vid, vnode->fid.vnode, len, start);
 
-	rcu_read_lock();
-
-	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each(&xas, folio, end) {
-		if (!folio_test_writeback(folio)) {
-			kdebug("bad %x @%llx page %lx %lx",
-			       len, start, folio_index(folio), end);
-			ASSERT(folio_test_writeback(folio));
-		}
-
-		trace_afs_folio_dirty(vnode, tracepoint_string("clear"), folio);
-		folio_end_writeback(folio);
-	}
-
-	rcu_read_unlock();
-
 	afs_prune_wb_keys(vnode);
 	_leave("");
 }
@@ -370,337 +159,53 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
 	return afs_put_operation(op);
 }
 
-/*
- * Extend the region to be written back to include subsequent contiguously
- * dirty pages if possible, but don't sleep while doing so.
- *
- * If this page holds new content, then we can include filler zeros in the
- * writeback.
- */
-static void afs_extend_writeback(struct address_space *mapping,
-				 struct afs_vnode *vnode,
-				 long *_count,
-				 loff_t start,
-				 loff_t max_len,
-				 bool caching,
-				 size_t *_len)
+static void afs_upload_to_server(struct netfs_io_subrequest *subreq)
 {
-	struct folio_batch fbatch;
-	struct folio *folio;
-	pgoff_t index = (start + *_len) / PAGE_SIZE;
-	bool stop = true;
-	unsigned int i;
-
-	XA_STATE(xas, &mapping->i_pages, index);
-	folio_batch_init(&fbatch);
-
-	do {
-		/* Firstly, we gather up a batch of contiguous dirty pages
-		 * under the RCU read lock - but we can't clear the dirty flags
-		 * there if any of those pages are mapped.
-		 */
-		rcu_read_lock();
-
-		xas_for_each(&xas, folio, ULONG_MAX) {
-			stop = true;
-			if (xas_retry(&xas, folio))
-				continue;
-			if (xa_is_value(folio))
-				break;
-			if (folio_index(folio) != index)
-				break;
-
-			if (!folio_try_get_rcu(folio)) {
-				xas_reset(&xas);
-				continue;
-			}
-
-			/* Has the folio moved or been split? */
-			if (unlikely(folio != xas_reload(&xas))) {
-				folio_put(folio);
-				break;
-			}
-
-			if (!folio_trylock(folio)) {
-				folio_put(folio);
-				break;
-			}
-			if (!folio_test_dirty(folio) ||
-			    folio_test_writeback(folio) ||
-			    folio_test_fscache(folio)) {
-				folio_unlock(folio);
-				folio_put(folio);
-				break;
-			}
-
-			index += folio_nr_pages(folio);
-			*_count -= folio_nr_pages(folio);
-			*_len += folio_size(folio);
-			stop = false;
-			if (*_len >= max_len || *_count <= 0)
-				stop = true;
-
-			if (!folio_batch_add(&fbatch, folio))
-				break;
-			if (stop)
-				break;
-		}
-
-		if (!stop)
-			xas_pause(&xas);
-		rcu_read_unlock();
-
-		/* Now, if we obtained any folios, we can shift them to being
-		 * writable and mark them for caching.
-		 */
-		if (!folio_batch_count(&fbatch))
-			break;
-
-		for (i = 0; i < folio_batch_count(&fbatch); i++) {
-			folio = fbatch.folios[i];
-			trace_afs_folio_dirty(vnode, tracepoint_string("store+"), folio);
+	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
+	ssize_t ret;
 
-			if (!folio_clear_dirty_for_io(folio))
-				BUG();
-			folio_start_writeback(folio);
-			afs_folio_start_fscache(caching, folio);
-			folio_unlock(folio);
-		}
+	_enter("%x[%x],%zx",
+	       subreq->rreq->debug_id, subreq->debug_index, subreq->io_iter.count);
 
-		folio_batch_release(&fbatch);
-		cond_resched();
-	} while (!stop);
+	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
+	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start,
+			     subreq->rreq->origin == NETFS_LAUNDER_WRITE);
+	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len,
+					  false);
 }
 
-/*
- * Synchronously write back the locked page and any subsequent non-locked dirty
- * pages.
- */
-static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
-						struct writeback_control *wbc,
-						struct folio *folio,
-						unsigned long long start,
-						unsigned long long end)
+static void afs_upload_to_server_worker(struct work_struct *work)
 {
-	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	struct iov_iter iter;
-	unsigned long long i_size = i_size_read(&vnode->netfs.inode);
-	size_t len, max_len;
-	bool caching = fscache_cookie_enabled(afs_vnode_cache(vnode));
-	long count = wbc->nr_to_write;
-	int ret;
-
-	_enter(",%lx,%llx-%llx", folio_index(folio), start, end);
-
-	folio_start_writeback(folio);
-	afs_folio_start_fscache(caching, folio);
-
-	count -= folio_nr_pages(folio);
-
-	/* Find all consecutive lockable dirty pages that have contiguous
-	 * written regions, stopping when we find a page that is not
-	 * immediately lockable, is not dirty or is missing, or we reach the
-	 * end of the range.
-	 */
-	trace_afs_folio_dirty(vnode, tracepoint_string("store"), folio);
-
-	len = folio_size(folio);
-	if (start < i_size) {
-		/* Trim the write to the EOF; the extra data is ignored.  Also
-		 * put an upper limit on the size of a single storedata op.
-		 */
-		max_len = 65536 * 4096;
-		max_len = min_t(unsigned long long, max_len, end - start + 1);
-		max_len = min_t(unsigned long long, max_len, i_size - start);
-
-		if (len < max_len)
-			afs_extend_writeback(mapping, vnode, &count,
-					     start, max_len, caching, &len);
-		len = min_t(unsigned long long, len, i_size - start);
-	}
-
-	/* We now have a contiguous set of dirty pages, each with writeback
-	 * set; the first page is still locked at this point, but all the rest
-	 * have been unlocked.
-	 */
-	folio_unlock(folio);
-
-	if (start < i_size) {
-		_debug("write back %zx @%llx [%llx]", len, start, i_size);
-
-		/* Speculatively write to the cache.  We have to fix this up
-		 * later if the store fails.
-		 */
-		afs_write_to_cache(vnode, start, len, i_size, caching);
-
-		iov_iter_xarray(&iter, ITER_SOURCE, &mapping->i_pages, start, len);
-		ret = afs_store_data(vnode, &iter, start, false);
-	} else {
-		_debug("write discard %zx @%llx [%llx]", len, start, i_size);
-
-		/* The dirty region was entirely beyond the EOF. */
-		fscache_clear_page_bits(mapping, start, len, caching);
-		afs_pages_written_back(vnode, start, len);
-		ret = 0;
-	}
-
-	switch (ret) {
-	case 0:
-		wbc->nr_to_write = count;
-		ret = len;
-		break;
-
-	default:
-		pr_notice("kAFS: Unexpected error from FS.StoreData %d\n", ret);
-		fallthrough;
-	case -EACCES:
-	case -EPERM:
-	case -ENOKEY:
-	case -EKEYEXPIRED:
-	case -EKEYREJECTED:
-	case -EKEYREVOKED:
-	case -ENETRESET:
-		afs_redirty_pages(wbc, mapping, start, len);
-		mapping_set_error(mapping, ret);
-		break;
-
-	case -EDQUOT:
-	case -ENOSPC:
-		afs_redirty_pages(wbc, mapping, start, len);
-		mapping_set_error(mapping, -ENOSPC);
-		break;
-
-	case -EROFS:
-	case -EIO:
-	case -EREMOTEIO:
-	case -EFBIG:
-	case -ENOENT:
-	case -ENOMEDIUM:
-	case -ENXIO:
-		trace_afs_file_error(vnode, ret, afs_file_error_writeback_fail);
-		afs_kill_pages(mapping, start, len);
-		mapping_set_error(mapping, ret);
-		break;
-	}
+	struct netfs_io_subrequest *subreq =
+		container_of(work, struct netfs_io_subrequest, work);
 
-	_leave(" = %d", ret);
-	return ret;
+	afs_upload_to_server(subreq);
 }
 
 /*
- * write a region of pages back to the server
+ * Set up write requests for a writeback slice.  We need to add a write request
+ * for each write we want to make.
  */
-static int afs_writepages_region(struct address_space *mapping,
-				 struct writeback_control *wbc,
-				 unsigned long long start,
-				 unsigned long long end, loff_t *_next,
-				 bool max_one_loop)
+void afs_create_write_requests(struct netfs_io_request *wreq, loff_t start, size_t len)
 {
-	struct folio *folio;
-	struct folio_batch fbatch;
-	ssize_t ret;
-	unsigned int i;
-	int n, skips = 0;
-
-	_enter("%llx,%llx,", start, end);
-	folio_batch_init(&fbatch);
+	struct netfs_io_subrequest *subreq;
 
-	do {
-		pgoff_t index = start / PAGE_SIZE;
+	_enter("%x,%llx-%llx", wreq->debug_id, start, start + len);
 
-		n = filemap_get_folios_tag(mapping, &index, end / PAGE_SIZE,
-					PAGECACHE_TAG_DIRTY, &fbatch);
-
-		if (!n)
-			break;
-		for (i = 0; i < n; i++) {
-			folio = fbatch.folios[i];
-			start = folio_pos(folio); /* May regress with THPs */
-
-			_debug("wback %lx", folio_index(folio));
-
-			/* At this point we hold neither the i_pages lock nor the
-			 * page lock: the page may be truncated or invalidated
-			 * (changing page->mapping to NULL), or even swizzled
-			 * back from swapper_space to tmpfs file mapping
-			 */
-try_again:
-			if (wbc->sync_mode != WB_SYNC_NONE) {
-				ret = folio_lock_killable(folio);
-				if (ret < 0) {
-					folio_batch_release(&fbatch);
-					return ret;
-				}
-			} else {
-				if (!folio_trylock(folio))
-					continue;
-			}
-
-			if (folio->mapping != mapping ||
-			    !folio_test_dirty(folio)) {
-				start += folio_size(folio);
-				folio_unlock(folio);
-				continue;
-			}
-
-			if (folio_test_writeback(folio) ||
-			    folio_test_fscache(folio)) {
-				folio_unlock(folio);
-				if (wbc->sync_mode != WB_SYNC_NONE) {
-					folio_wait_writeback(folio);
-#ifdef CONFIG_AFS_FSCACHE
-					folio_wait_fscache(folio);
-#endif
-					goto try_again;
-				}
-
-				start += folio_size(folio);
-				if (wbc->sync_mode == WB_SYNC_NONE) {
-					if (skips >= 5 || need_resched()) {
-						*_next = start;
-						folio_batch_release(&fbatch);
-						_leave(" = 0 [%llx]", *_next);
-						return 0;
-					}
-					skips++;
-				}
-				continue;
-			}
-
-			if (!folio_clear_dirty_for_io(folio))
-				BUG();
-			ret = afs_write_back_from_locked_folio(mapping, wbc,
-					folio, start, end);
-			if (ret < 0) {
-				_leave(" = %zd", ret);
-				folio_batch_release(&fbatch);
-				return ret;
-			}
-
-			start += ret;
-		}
-
-		folio_batch_release(&fbatch);
-		cond_resched();
-	} while (wbc->nr_to_write > 0);
-
-	*_next = start;
-	_leave(" = 0 [%llx]", *_next);
-	return 0;
+	subreq = netfs_create_write_request(wreq, NETFS_UPLOAD_TO_SERVER,
+					    start, len, afs_upload_to_server_worker);
+	if (subreq)
+		netfs_queue_write_request(subreq);
 }
 
 /*
  * write some of the pending data back to the server
  */
-int afs_writepages(struct address_space *mapping,
-		   struct writeback_control *wbc)
+int afs_writepages(struct address_space *mapping, struct writeback_control *wbc)
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
-	loff_t start, next;
 	int ret;
 
-	_enter("");
-
 	/* We have to be careful as we can end up racing with setattr()
 	 * truncating the pagecache since the caller doesn't take a lock here
 	 * to prevent it.
@@ -710,68 +215,11 @@ int afs_writepages(struct address_space *mapping,
 	else if (!down_read_trylock(&vnode->validate_lock))
 		return 0;
 
-	if (wbc->range_cyclic) {
-		start = mapping->writeback_index * PAGE_SIZE;
-		ret = afs_writepages_region(mapping, wbc, start, LLONG_MAX,
-					    &next, false);
-		if (ret == 0) {
-			mapping->writeback_index = next / PAGE_SIZE;
-			if (start > 0 && wbc->nr_to_write > 0) {
-				ret = afs_writepages_region(mapping, wbc, 0,
-							    start, &next, false);
-				if (ret == 0)
-					mapping->writeback_index =
-						next / PAGE_SIZE;
-			}
-		}
-	} else if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX) {
-		ret = afs_writepages_region(mapping, wbc, 0, LLONG_MAX,
-					    &next, false);
-		if (wbc->nr_to_write > 0 && ret == 0)
-			mapping->writeback_index = next / PAGE_SIZE;
-	} else {
-		ret = afs_writepages_region(mapping, wbc,
-					    wbc->range_start, wbc->range_end,
-					    &next, false);
-	}
-
+	ret = netfs_writepages(mapping, wbc);
 	up_read(&vnode->validate_lock);
-	_leave(" = %d", ret);
 	return ret;
 }
 
-/*
- * write to an AFS file
- */
-ssize_t afs_file_write(struct kiocb *iocb, struct iov_iter *from)
-{
-	struct afs_vnode *vnode = AFS_FS_I(file_inode(iocb->ki_filp));
-	struct afs_file *af = iocb->ki_filp->private_data;
-	ssize_t result;
-	size_t count = iov_iter_count(from);
-
-	_enter("{%llx:%llu},{%zu},",
-	       vnode->fid.vid, vnode->fid.vnode, count);
-
-	if (IS_SWAPFILE(&vnode->netfs.inode)) {
-		printk(KERN_INFO
-		       "AFS: Attempt to write to active swap file!\n");
-		return -EBUSY;
-	}
-
-	if (!count)
-		return 0;
-
-	result = afs_validate(vnode, af->key);
-	if (result < 0)
-		return result;
-
-	result = generic_file_write_iter(iocb, from);
-
-	_leave(" = %zd", result);
-	return result;
-}
-
 /*
  * flush any dirty pages for this process, and check for write errors.
  * - the return status from this call provides a reliable indication of
@@ -800,49 +248,11 @@ int afs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
  */
 vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 {
-	struct folio *folio = page_folio(vmf->page);
 	struct file *file = vmf->vma->vm_file;
-	struct inode *inode = file_inode(file);
-	struct afs_vnode *vnode = AFS_FS_I(inode);
-	struct afs_file *af = file->private_data;
-	vm_fault_t ret = VM_FAULT_RETRY;
-
-	_enter("{{%llx:%llu}},{%lx}", vnode->fid.vid, vnode->fid.vnode, folio_index(folio));
-
-	afs_validate(vnode, af->key);
-
-	sb_start_pagefault(inode->i_sb);
-
-	/* Wait for the page to be written to the cache before we allow it to
-	 * be modified.  We then assume the entire page will need writing back.
-	 */
-#ifdef CONFIG_AFS_FSCACHE
-	if (folio_test_fscache(folio) &&
-	    folio_wait_fscache_killable(folio) < 0)
-		goto out;
-#endif
-
-	if (folio_wait_writeback_killable(folio))
-		goto out;
-
-	if (folio_lock_killable(folio) < 0)
-		goto out;
-
-	if (folio_wait_writeback_killable(folio) < 0) {
-		folio_unlock(folio);
-		goto out;
-	}
-
-	if (folio_test_dirty(folio))
-		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite+"), folio);
-	else
-		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite"), folio);
-	file_update_time(file);
 
-	ret = VM_FAULT_LOCKED;
-out:
-	sb_end_pagefault(inode->i_sb);
-	return ret;
+	if (afs_validate(AFS_FS_I(file_inode(file)), afs_file_key(file)) < 0)
+		return VM_FAULT_SIGBUS;
+	return netfs_page_mkwrite(vmf, NULL);
 }
 
 /*
@@ -872,60 +282,3 @@ void afs_prune_wb_keys(struct afs_vnode *vnode)
 		afs_put_wb_key(wbk);
 	}
 }
-
-/*
- * Clean up a page during invalidation.
- */
-int afs_launder_folio(struct folio *folio)
-{
-	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
-	struct iov_iter iter;
-	struct bio_vec bv;
-	unsigned long long fend, i_size = vnode->netfs.inode.i_size;
-	size_t len;
-	int ret = 0;
-
-	_enter("{%lx}", folio->index);
-
-	if (folio_clear_dirty_for_io(folio) && folio_pos(folio) < i_size) {
-		len = folio_size(folio);
-		fend = folio_pos(folio) + len;
-		if (vnode->netfs.inode.i_size < fend)
-			len = fend - i_size;
-
-		bvec_set_folio(&bv, folio, len, 0);
-		iov_iter_bvec(&iter, WRITE, &bv, 1, len);
-
-		trace_afs_folio_dirty(vnode, tracepoint_string("launder"), folio);
-		ret = afs_store_data(vnode, &iter, folio_pos(folio), true);
-	}
-
-	trace_afs_folio_dirty(vnode, tracepoint_string("laundered"), folio);
-	folio_wait_fscache(folio);
-	return ret;
-}
-
-/*
- * Deal with the completion of writing the data to the cache.
- */
-static void afs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
-				    bool was_async)
-{
-	struct afs_vnode *vnode = priv;
-
-	if (IS_ERR_VALUE(transferred_or_error) &&
-	    transferred_or_error != -ENOBUFS)
-		afs_invalidate_cache(vnode, 0);
-}
-
-/*
- * Save the write to the cache also.
- */
-static void afs_write_to_cache(struct afs_vnode *vnode,
-			       loff_t start, size_t len, loff_t i_size,
-			       bool caching)
-{
-	fscache_write_to_cache(afs_vnode_cache(vnode),
-			       vnode->netfs.inode.i_mapping, start, len, i_size,
-			       afs_write_to_cache_done, vnode, caching);
-}
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index 08506680350c..754358149372 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -837,29 +837,6 @@ TRACE_EVENT(afs_dir_check_failed,
 		      __entry->vnode, __entry->off, __entry->i_size)
 	    );
 
-TRACE_EVENT(afs_folio_dirty,
-	    TP_PROTO(struct afs_vnode *vnode, const char *where, struct folio *folio),
-
-	    TP_ARGS(vnode, where, folio),
-
-	    TP_STRUCT__entry(
-		    __field(struct afs_vnode *,		vnode)
-		    __field(const char *,		where)
-		    __field(pgoff_t,			index)
-		    __field(size_t,			size)
-			     ),
-
-	    TP_fast_assign(
-		    __entry->vnode = vnode;
-		    __entry->where = where;
-		    __entry->index = folio_index(folio);
-		    __entry->size = folio_size(folio);
-			   ),
-
-	    TP_printk("vn=%p ix=%05lx s=%05lx %s",
-		      __entry->vnode, __entry->index, __entry->size, __entry->where)
-	    );
-
 TRACE_EVENT(afs_call_state,
 	    TP_PROTO(struct afs_call *call,
 		     enum afs_call_state from,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

