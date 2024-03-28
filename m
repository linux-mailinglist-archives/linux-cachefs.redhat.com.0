Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLV2S2YAMGQEXJSRILY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC888905A8
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:39:11 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6904f4bc70bsf11919716d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:39:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643950; cv=pass;
        d=google.com; s=arc-20160816;
        b=RQIEh9aUiXAq+GIdrL0LmNwesSH/TsSPIvqzU/mtDOIaj+tB7m/zh1oTwhawYvO74O
         7oeTcDXr3rMhkJlByBOCrRijFPSXPMygLsYhrny6j/wtMPwnZMNOA3M2GTSf39Qa+lf/
         CPnZ6sK3l0n4KYbPjes+bi1fLmVxxf9jjUusXb3jKQA93ZHfFUxYFc/HOO4baeNIkb4D
         4Nq9FulaO6a+xyWGzgAFsX2zz2quQLStpNX9AQWnbzOHeNG3eL+IuL46K/FXzqGtZud+
         729FzzRmbnB0tAxWzTFGSMe/wVBx2dBc1os2QmekQR0oQGfD+r5CY/bqYm3LL+sk2vKL
         f4PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kU8/TPOszdEwy+S5czcJHRlPbHuqHmallFr2TGr9gSk=;
        fh=wcOtJS9ZLKTgM5DR+fhbK7EAp8Cbtc5+XPZYYFxpumQ=;
        b=OGSRv214+qGy0CuqiubTA31xNo9HISxUQUrr/LpcE5kFDzzHsZRnaP6SO845f5y/b/
         ludLEj1rGIeTEph+Ft6sVTt6AZ1cHcG6TCFdUkJ/W2rOA0zNJNRn8cuaboNKKU/HXBN2
         2o3MzOP6SDfC1VuxGwMqdfND6f935WOF8T/sEhZZqApu7TGf+K8neYzbYrITTridqibJ
         6CM4fm2d9I/lbwb8a2jOACWmypq5qOb7tDqQvOhdAa6K6wBlB7g2PXYlVM5ofKi8RxvC
         kWP5mjVJUsOi3AUHP6Hr3liLcA0VnIjS7Z9iLi6RftAyrgd2rR/IMkWJckOWWmTYZoRv
         JSpg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643950; x=1712248750;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU8/TPOszdEwy+S5czcJHRlPbHuqHmallFr2TGr9gSk=;
        b=WYKsdPcM3cHqMPjT25MqYYZNPPC3SgHojGE3bTU3n1P8zR1EbbTFEtHg/+CmIJcxyr
         u5cBt2D7igfk9J7VPKKtIZr/ONPxGrgb4Ko39fZKizmF2D/zACvKriD2MtOFIqm9G0eY
         YhK91ji1z/c698uzana+xlxLOSqmxowwm6QXbC7sWypkHAS/9I16TK446lnBvby10UR5
         leFU3hV4cNpXAshSfUenMfA3UVr4HX0b/1BStGd39B5gBIyCH9q+zS3ek9DVronMyRQV
         br8BoG3z8Q+rud0brbogcjxfVEfHBBn5D2oE95AyTDhSN4KyK9+6jm4eP55OfWxuYwMB
         E5pQ==
X-Forwarded-Encrypted: i=2; AJvYcCVdDHxuBf7iEcmfdgOmn9mW8BfiONt98zv0HhOoWE6ZkG/Ke+ynFqi+K7X6yO8iQkOw+JoGp9Kfk1L2qftF6ViFDhkKOFCgvG2e0Es=
X-Gm-Message-State: AOJu0Yw6GJSthrmY04ECE6vnR980ae74Ph+5hmF+VihvyCk3GVwPyFDK
	/v23urVmhIHnopiGYAFI8UUbgOq4/ii3Pl4gp0SVvM7OyyRmZnO/pzEo9WHU9jk=
X-Google-Smtp-Source: AGHT+IEXRaUkV0FTJ4pwsBj7EoxJ1K/XbmJRla0sCzA3VnWHnmcNczegPfF0ccqytEnBvxI5n7NAgw==
X-Received: by 2002:ad4:4b6f:0:b0:696:929f:31cc with SMTP id m15-20020ad44b6f000000b00696929f31ccmr1744050qvx.10.1711643950494;
        Thu, 28 Mar 2024 09:39:10 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:d64:b0:696:7032:47f9 with SMTP id
 4-20020a0562140d6400b00696703247f9ls1554252qvs.2.-pod-prod-01-us; Thu, 28 Mar
 2024 09:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoBiJp/nPsrIYgNlLJRTIAnJbJmmkEi5hbm8NDE2NrNhCa3GmRWbRSoeXoLuxEUNywrVWeZEvZpX7zg4/wwnl6Qm3FXtIaFO5RJyjYHRc=
X-Received: by 2002:a05:620a:1598:b0:78a:46dd:ef02 with SMTP id d24-20020a05620a159800b0078a46ddef02mr3579488qkk.12.1711643949728;
        Thu, 28 Mar 2024 09:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643949; cv=none;
        d=google.com; s=arc-20160816;
        b=A8zZp/kiQz3za1gZtDVAKBI/ekMSxp7aZDju8liS6uJhvpC8/QgO9zhP67SuwSPJTx
         TTVCeIgeYLw9sfuPZviNzcgGBY4xwPDietkhi2xFWStJoqbZSI+/m7oFJxGVkn94eSpt
         HRTeVLcGUgEgtT5DZwlSt2/1srsNwP/CM0GNWsCN8rQddHLo8n5rVilWPfoDnvNXVDOo
         Ll8yJTXgTMVn7a6qPCCdV1u+z9HwquVFy84fTvaa5w2c/tijhy2K9U6f3UJBC+Mx5vYP
         4qXSVifed7o0nLYZxexzYhJ3q6NsFOWhkcOoH4xRbaoLp4t508y7Xj0eatUrEMEIZmYU
         xgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=clNmVAkUKGd8Z01ZlWkYBIz9mR2bmkgLzFIGVS5d4sY=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=M5O9OFq0y/AwMfdJiJIGfpo1xtLhV8PgBSoq+5zFtVspxEYbDoPx7w+AldpTGzW3U8
         fOvxSXu2+FWDBn66xLY/uUuixif/CjTY07Gu7kv4+NtzaRhZPWZ/WGq1w0lMIlesD1G9
         WJCzHNTRYxyFl8cAdBjC9zjXxguEEIr2OgM7iPQ9yT6OCfmiLAJ51enStL/4WX9FN4JL
         W66hQ5eWJ9SaO7v9948CJdqxF2Aw99sOY/GSBO0uJr805Nx5K9yHmsEkZ8t2zZ+wgG0v
         Aq5pQh370z4wMmuGGKHsyDuAuCHcxkXzkPoB/zB4eTSvelQkO4Z+DEoQQ2CWBjNhYuhJ
         f9cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o14-20020a05620a228e00b0078a37837b2bsi1695542qkh.683.2024.03.28.09.39.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-BSPc68HcMqWXpXRjBhZZZQ-1; Thu,
 28 Mar 2024 12:39:08 -0400
X-MC-Unique: BSPc68HcMqWXpXRjBhZZZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB53F3C0E201
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:39:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D753FC423E1; Thu, 28 Mar 2024 16:39:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98F80C423E0;
	Thu, 28 Mar 2024 16:39:04 +0000 (UTC)
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
Subject: [PATCH 26/26] netfs, afs: Use writeback retry to deal with alternate keys
Date: Thu, 28 Mar 2024 16:34:18 +0000
Message-ID: <20240328163424.2781320-27-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
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

Use a hook in the new writeback code's retry algorithm to rotate the keys
once all the outstanding subreqs have failed rather than doing it
separately on each subreq.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/afs/file.c            |   1 +
 fs/afs/internal.h        |   1 +
 fs/afs/write.c           | 175 +++++++++++++++++++--------------------
 fs/netfs/write_collect.c |   9 +-
 include/linux/netfs.h    |   2 +
 5 files changed, 96 insertions(+), 92 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 8f983e3ecae7..c3f0c45ae9a9 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -368,6 +368,7 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 static void afs_free_request(struct netfs_io_request *rreq)
 {
 	key_put(rreq->netfs_priv);
+	afs_put_wb_key(rreq->netfs_priv2);
 }
 
 static void afs_update_i_size(struct inode *inode, loff_t new_i_size)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 887245f9336d..6e1d3c4daf72 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1601,6 +1601,7 @@ extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 void afs_prepare_write(struct netfs_io_subrequest *subreq);
 void afs_issue_write(struct netfs_io_subrequest *subreq);
 void afs_begin_writeback(struct netfs_io_request *wreq);
+void afs_retry_request(struct netfs_io_request *wreq, struct netfs_io_stream *stream);
 extern int afs_writepages(struct address_space *, struct writeback_control *);
 extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 6ef7d4cbc008..838db2e94388 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -29,43 +29,39 @@ static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsign
 
 /*
  * Find a key to use for the writeback.  We cached the keys used to author the
- * writes on the vnode.  *_wbk will contain the last writeback key used or NULL
- * and we need to start from there if it's set.
+ * writes on the vnode.  wreq->netfs_priv2 will contain the last writeback key
+ * record used or NULL and we need to start from there if it's set.
+ * wreq->netfs_priv will be set to the key itself or NULL.
  */
-static int afs_get_writeback_key(struct afs_vnode *vnode,
-				 struct afs_wb_key **_wbk)
+static void afs_get_writeback_key(struct netfs_io_request *wreq)
 {
-	struct afs_wb_key *wbk = NULL;
-	struct list_head *p;
-	int ret = -ENOKEY, ret2;
+	struct afs_wb_key *wbk, *old = wreq->netfs_priv2;
+	struct afs_vnode *vnode = AFS_FS_I(wreq->inode);
+
+	key_put(wreq->netfs_priv);
+	wreq->netfs_priv = NULL;
+	wreq->netfs_priv2 = NULL;
 
 	spin_lock(&vnode->wb_lock);
-	if (*_wbk)
-		p = (*_wbk)->vnode_link.next;
+	if (old)
+		wbk = list_next_entry(old, vnode_link);
 	else
-		p = vnode->wb_keys.next;
+		wbk = list_first_entry(&vnode->wb_keys, struct afs_wb_key, vnode_link);
 
-	while (p != &vnode->wb_keys) {
-		wbk = list_entry(p, struct afs_wb_key, vnode_link);
+	list_for_each_entry_from(wbk, &vnode->wb_keys, vnode_link) {
 		_debug("wbk %u", key_serial(wbk->key));
-		ret2 = key_validate(wbk->key);
-		if (ret2 == 0) {
+		if (key_validate(wbk->key) == 0) {
 			refcount_inc(&wbk->usage);
+			wreq->netfs_priv = key_get(wbk->key);
+			wreq->netfs_priv2 = wbk;
 			_debug("USE WB KEY %u", key_serial(wbk->key));
 			break;
 		}
-
-		wbk = NULL;
-		if (ret == -ENOKEY)
-			ret = ret2;
-		p = p->next;
 	}
 
 	spin_unlock(&vnode->wb_lock);
-	if (*_wbk)
-		afs_put_wb_key(*_wbk);
-	*_wbk = wbk;
-	return 0;
+
+	afs_put_wb_key(old);
 }
 
 static void afs_store_data_success(struct afs_operation *op)
@@ -88,72 +84,83 @@ static const struct afs_operation_ops afs_store_data_operation = {
 };
 
 /*
- * write to a file
+ * Prepare a subrequest to write to the server.  This sets the max_len
+ * parameter.
  */
-static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos)
+void afs_prepare_write(struct netfs_io_subrequest *subreq)
+{
+	//if (test_bit(NETFS_SREQ_RETRYING, &subreq->flags))
+	//	subreq->max_len = 512 * 1024;
+	//else
+	subreq->max_len = 256 * 1024 * 1024;
+}
+
+/*
+ * Issue a subrequest to write to the server.
+ */
+void afs_issue_write(struct netfs_io_subrequest *subreq)
 {
+	struct netfs_io_request *wreq = subreq->rreq;
 	struct afs_operation *op;
-	struct afs_wb_key *wbk = NULL;
-	loff_t size = iov_iter_count(iter);
+	struct afs_vnode *vnode = AFS_FS_I(wreq->inode);
+	unsigned long long pos = subreq->start + subreq->transferred;
+	size_t len = subreq->len - subreq->transferred;
 	int ret = -ENOKEY;
 
-	_enter("%s{%llx:%llu.%u},%llx,%llx",
+	_enter("R=%x[%x],%s{%llx:%llu.%u},%llx,%zx",
+	       wreq->debug_id, subreq->debug_index,
 	       vnode->volume->name,
 	       vnode->fid.vid,
 	       vnode->fid.vnode,
 	       vnode->fid.unique,
-	       size, pos);
+	       pos, len);
 
-	ret = afs_get_writeback_key(vnode, &wbk);
-	if (ret) {
-		_leave(" = %d [no keys]", ret);
-		return ret;
-	}
+#if 0 // Error injection
+	if (subreq->debug_index == 3)
+		return netfs_write_subrequest_terminated(subreq, -ENOANO, false);
 
-	op = afs_alloc_operation(wbk->key, vnode->volume);
-	if (IS_ERR(op)) {
-		afs_put_wb_key(wbk);
-		return -ENOMEM;
+	if (!test_bit(NETFS_SREQ_RETRYING, &subreq->flags)) {
+		set_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
+		return netfs_write_subrequest_terminated(subreq, -EAGAIN, false);
 	}
+#endif
+
+	op = afs_alloc_operation(wreq->netfs_priv, vnode->volume);
+	if (IS_ERR(op))
+		return netfs_write_subrequest_terminated(subreq, -EAGAIN, false);
 
 	afs_op_set_vnode(op, 0, vnode);
-	op->file[0].dv_delta = 1;
+	op->file[0].dv_delta	= 1;
 	op->file[0].modification = true;
-	op->store.pos = pos;
-	op->store.size = size;
-	op->flags |= AFS_OPERATION_UNINTR;
-	op->ops = &afs_store_data_operation;
+	op->store.pos		= pos;
+	op->store.size		= len,
+	op->flags		|= AFS_OPERATION_UNINTR;
+	op->ops			= &afs_store_data_operation;
 
-try_next_key:
 	afs_begin_vnode_operation(op);
 
-	op->store.write_iter = iter;
-	op->store.i_size = max(pos + size, vnode->netfs.remote_i_size);
-	op->mtime = inode_get_mtime(&vnode->netfs.inode);
+	op->store.write_iter	= &subreq->io_iter;
+	op->store.i_size	= umax(pos + len, vnode->netfs.remote_i_size);
+	op->mtime		= inode_get_mtime(&vnode->netfs.inode);
 
 	afs_wait_for_operation(op);
-
-	switch (afs_op_error(op)) {
+	ret = afs_put_operation(op);
+	switch (ret) {
 	case -EACCES:
 	case -EPERM:
 	case -ENOKEY:
 	case -EKEYEXPIRED:
 	case -EKEYREJECTED:
 	case -EKEYREVOKED:
-		_debug("next");
-
-		ret = afs_get_writeback_key(vnode, &wbk);
-		if (ret == 0) {
-			key_put(op->key);
-			op->key = key_get(wbk->key);
-			goto try_next_key;
-		}
+		/* If there are more keys we can try, use the retry algorithm
+		 * to rotate the keys.
+		 */
+		if (wreq->netfs_priv2)
+			set_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
 		break;
 	}
 
-	afs_put_wb_key(wbk);
-	_leave(" = %d", afs_op_error(op));
-	return afs_put_operation(op);
+	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len, false);
 }
 
 /*
@@ -162,44 +169,32 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
  */
 void afs_begin_writeback(struct netfs_io_request *wreq)
 {
+	afs_get_writeback_key(wreq);
 	wreq->io_streams[0].avail = true;
 }
 
 /*
- * Prepare a subrequest to write to the server.  This sets the max_len
- * parameter.
- */
-void afs_prepare_write(struct netfs_io_subrequest *subreq)
-{
-	//if (test_bit(NETFS_SREQ_RETRYING, &subreq->flags))
-	//	subreq->max_len = 512 * 1024;
-	//else
-	subreq->max_len = 256 * 1024 * 1024;
-}
-
-/*
- * Issue a subrequest to write to the server.
+ * Prepare to retry the writes in request.  Use this to try rotating the
+ * available writeback keys.
  */
-void afs_issue_write(struct netfs_io_subrequest *subreq)
+void afs_retry_request(struct netfs_io_request *wreq, struct netfs_io_stream *stream)
 {
-	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
-	ssize_t ret;
-
-	_enter("%x[%x],%zx",
-	       subreq->rreq->debug_id, subreq->debug_index, subreq->io_iter.count);
-
-#if 0 // Error injection
-	if (subreq->debug_index == 3)
-		return netfs_write_subrequest_terminated(subreq, -ENOANO, false);
+	struct netfs_io_subrequest *subreq =
+		list_first_entry(&stream->subrequests,
+				 struct netfs_io_subrequest, rreq_link);
 
-	if (!test_bit(NETFS_SREQ_RETRYING, &subreq->flags)) {
-		set_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
-		return netfs_write_subrequest_terminated(subreq, -EAGAIN, false);
+	switch (subreq->error) {
+	case -EACCES:
+	case -EPERM:
+	case -ENOKEY:
+	case -EKEYEXPIRED:
+	case -EKEYREJECTED:
+	case -EKEYREVOKED:
+		afs_get_writeback_key(wreq);
+		if (!wreq->netfs_priv)
+			stream->failed = true;
+		break;
 	}
-#endif
-
-	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start);
-	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len, false);
 }
 
 /*
diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index bea939ab0830..7ff15e2d7270 100644
--- a/fs/netfs/write_collect.c
+++ b/fs/netfs/write_collect.c
@@ -168,6 +168,13 @@ static void netfs_retry_write_stream(struct netfs_io_request *wreq,
 
 	_enter("R=%x[%x:]", wreq->debug_id, stream->stream_nr);
 
+	if (list_empty(&stream->subrequests))
+		return;
+
+	if (stream->source == NETFS_UPLOAD_TO_SERVER &&
+	    wreq->netfs_ops->retry_request)
+		wreq->netfs_ops->retry_request(wreq, stream);
+
 	if (unlikely(stream->failed))
 		return;
 
@@ -187,8 +194,6 @@ static void netfs_retry_write_stream(struct netfs_io_request *wreq,
 		return;
 	}
 
-	if (list_empty(&stream->subrequests))
-		return;
 	next = stream->subrequests.next;
 
 	do {
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c2ba364041b0..298552f5122c 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -235,6 +235,7 @@ struct netfs_io_request {
 	struct iov_iter		iter;		/* Unencrypted-side iterator */
 	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
+	void			*netfs_priv2;	/* Private data for the netfs */
 	struct bio_vec		*direct_bv;	/* DIO buffer list (when handling iovec-iter) */
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
 	unsigned int		debug_id;
@@ -306,6 +307,7 @@ struct netfs_request_ops {
 	void (*begin_writeback)(struct netfs_io_request *wreq);
 	void (*prepare_write)(struct netfs_io_subrequest *subreq);
 	void (*issue_write)(struct netfs_io_subrequest *subreq);
+	void (*retry_request)(struct netfs_io_request *wreq, struct netfs_io_stream *stream);
 	void (*invalidate_cache)(struct netfs_io_request *wreq);
 };
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

