Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJVZS2YAMGQE43VWTCA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F089056B
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:36:55 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5a51278547bsf1134875eaf.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:36:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643814; cv=pass;
        d=google.com; s=arc-20160816;
        b=FdzWKs+ogCd37b9b7O4YmRpcOSz4/W+6jJpPM3vXulwF0Zno4pbyQCLzUY+T3t0giC
         7gzD1sHwjZhrAoMtE8DdUKHzKIjpVkYSrMAtPrWG1/fNr8AYI1a22R+rtA85kaqaW4xq
         HUkj+QuChMS33d+5Wublh1sQrkdvKF9gS2CztEYI8y2kyoRnlsHUE/hhGUA22HRl223V
         zMXBNqevsX7UbfvJhXgSU29/I8VE9bVTWAJVea1McJgyrduBU3CycWKfcPxW4YgoRs+N
         OejmyV2p+BCpyIgRz6eLaVGo9YUFo4Cul7CR55JZu2dI7MAzt+bifegEy+9js9QDTZBc
         IaZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SPxKeDAw3Gp3kyG3o/kbjc3FbE/wpLqzWX8frK3w3/w=;
        fh=4YZkjQDjIMVPi+kTvE1bbMnTjZXHJch9KrPMamQUwaw=;
        b=XxDVE12+3cUBXM5ZctgOr0ObLDN2teJFk3ln8NU0ezZTrz4GiVdrCNnBKE7fU02hhX
         ytQgcNhkbhXDuEhHHGSuNvLOfzZVBtzJ0n+kW5c4gHAFMTsDUhyCltQv4r9gnfNREB38
         hZuPo6c6pXedLoInL/tcn3rtMhOkpkJmmFROpCs5+k8owPPKxHTSXvRSa2epZP3OJsx3
         Rm7ZlNDmWGIg4moqUyGnDO1ZCbuSfluHM/8ZrBtAAHJBHUQmHKW+5G6Xgym4AEhjCrfg
         mUGRtsGE3UcV/6yxTv7ldGsslsEo0CV9ARHtOmnhQebOsC+kVKm7hifTU/upEXwSBGcI
         ZE+A==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643814; x=1712248614;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPxKeDAw3Gp3kyG3o/kbjc3FbE/wpLqzWX8frK3w3/w=;
        b=hvpG4GZBpgIl9Zi2Y7IaC1xLVT/AKs+lAXdlqrNGrEKwzYKk5+qp8a9a97wRvy0Icg
         A7tfffDX3SZPDa+MgsWbtaTW5FemFFeGRtRmOlh4C8tvRBPbvKm9EtiPVpXnvClr5il0
         eirPA33g638ttRTyb+D58AGe8veHFbToUHP40AII0tmQvt4McNObiLSUf7lmrZdNbK1w
         KmfFd8UkORSsuJamjIJD17qyqgn1MSxU7xddz9MKxsbBkVOnKR/3pnjVtdyohkhCh+z4
         RdQ1ym1l7LkhiX6pvvnyeLxC63pz7yyM5/Fl3KX5/fYoXKKA6vPuGWhiYLDw5Yq2nXxv
         oJwg==
X-Forwarded-Encrypted: i=2; AJvYcCUj3lGuMOvkT+qfYaSESfX3g/1tClGckPowkPp66taiBjP0iKtwunlCjBht+nVfEw6gBMrc0PBgWlXh2OpPM+uOOAcMex29uG72BDc=
X-Gm-Message-State: AOJu0YyrU3wLLZX8GoMJvGcOgwnovogEvLUR9EMGE/LlvMofzycexyOF
	SIa3PIj6nQ/Bch9JTp3BrA9kQ4Lgf1NxrRzfg85Snx93HBVEOmq0BtgJnc7oXMo=
X-Google-Smtp-Source: AGHT+IFa5/wCDhKIR49Wmee93iYARNCkdNpdLxxk3Uu6DhiJZwSeeY30j7lh+WSHqT5nlWaTazZdvQ==
X-Received: by 2002:a05:6820:2611:b0:5a1:78c0:4327 with SMTP id cy17-20020a056820261100b005a178c04327mr3728426oob.4.1711643814162;
        Thu, 28 Mar 2024 09:36:54 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:22a6:b0:5a4:6ef1:24f0 with SMTP id
 ck38-20020a05682022a600b005a46ef124f0ls1271179oob.0.-pod-prod-03-us; Thu, 28
 Mar 2024 09:36:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMBvosmwt8vl3Ox7ZyCZGz0VbqPObWVS1VOqHKzkYiWZpAmNuBEtgo+6vC7STn99KKKJunHH1xeiGk1MGsc3QC3dFO4mwAWi656kxWoF4=
X-Received: by 2002:a05:6808:158d:b0:3c3:d0f5:198d with SMTP id t13-20020a056808158d00b003c3d0f5198dmr4485827oiw.40.1711643813482;
        Thu, 28 Mar 2024 09:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643813; cv=none;
        d=google.com; s=arc-20160816;
        b=IAjYcY/Llu5M8crR8nxVeu6HcWCGlvtg9H+Nw7giUZl2brClQaBKtQ3tbaO+lmGFOn
         39qfgbzOP90ENHC0RD32T4acqaP0E+R8iuTed2TAfzCYMU0Bfk2MTmrVIETCJ3VaiKoF
         CKW5OIJW4a/pd5PKY+1R9WIKQqWotw/lqav6CNJ+0VBc5XZXmXbREDJxjQfp2zZQJQrB
         cvNfhrAeOYMdb/YbO4YQxRprAWnpqholrVjqtOBN9YxWTe2GmitT6ixh3biH1lFmlon6
         yI8llHTDdPScoJRqlSE/ZWQwYf+1s1Vnlo0Jn2KbLLgk3Tq48hHomVVfZsJNeL3tvNXw
         jLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jGg2pE70yherxMJt9KbXBpbcL/Vim4d4R7ndYfiDuYs=;
        fh=D72SRyTeGTT5e8cHVnWso1+T4PfZOoBdL/zxY6by6YI=;
        b=pX/v2QiRqkEtdjJ5NUjd5R+Z1wibzvYRg1xIP++0qSVQR+6zLPASKIkSmAwUUY0pCu
         WXpoqqk0tKb4lV+Zh3cun/Y41wnQ8NtlgmQhNpebhElAAPjHv4wbMbxgFpXQbnYDrkKj
         MfziOfRVq7ZREjuC7gOUjgHNWR9mC46DUAEcvXtikwwm6tHusym31Jpqx64q155KcGaF
         4vFlnHTnEp5Hq0m/QlR9iifkTqQSvEGGg6eT/DU538C4466ocG7dRfr7dDE35751v1F6
         3doKhN9LRPDhVgixcr+qcwMsKzgTqwBvh8OtHumnSH6UJXcmogpWjVePMsdMEcvr1FQZ
         h/zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g18-20020ad457b2000000b006987e513c73si1021516qvx.198.2024.03.28.09.36.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-KKSFcKRdOOWvEMwqEii_YQ-1; Thu,
 28 Mar 2024 12:36:51 -0400
X-MC-Unique: KKSFcKRdOOWvEMwqEii_YQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 690F33C02466
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 64F6817AA7; Thu, 28 Mar 2024 16:36:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3D2E17AA3;
	Thu, 28 Mar 2024 16:36:47 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH 10/26] cifs: Use alternative invalidation to using launder_folio
Date: Thu, 28 Mar 2024 16:34:02 +0000
Message-ID: <20240328163424.2781320-11-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Use writepages-based flushing invalidation instead of
invalidate_inode_pages2() and ->launder_folio().  This will allow
->launder_folio() to be removed eventually.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/smb/client/cifsfs.h |   1 -
 fs/smb/client/file.c   | 122 -----------------------------------------
 fs/smb/client/inode.c  |  25 ++-------
 3 files changed, 5 insertions(+), 143 deletions(-)

diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index ca55d01117c8..1ab7e5998c58 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -69,7 +69,6 @@ extern int cifs_revalidate_file_attr(struct file *filp);
 extern int cifs_revalidate_dentry_attr(struct dentry *);
 extern int cifs_revalidate_file(struct file *filp);
 extern int cifs_revalidate_dentry(struct dentry *);
-extern int cifs_invalidate_mapping(struct inode *inode);
 extern int cifs_revalidate_mapping(struct inode *inode);
 extern int cifs_zap_mapping(struct inode *inode);
 extern int cifs_getattr(struct mnt_idmap *, const struct path *,
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 59da572d3384..f92d4d42e87e 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2576,64 +2576,6 @@ struct cifs_writedata *cifs_writedata_alloc(work_func_t complete)
 	return wdata;
 }
 
-static int cifs_partialpagewrite(struct page *page, unsigned from, unsigned to)
-{
-	struct address_space *mapping = page->mapping;
-	loff_t offset = (loff_t)page->index << PAGE_SHIFT;
-	char *write_data;
-	int rc = -EFAULT;
-	int bytes_written = 0;
-	struct inode *inode;
-	struct cifsFileInfo *open_file;
-
-	if (!mapping || !mapping->host)
-		return -EFAULT;
-
-	inode = page->mapping->host;
-
-	offset += (loff_t)from;
-	write_data = kmap(page);
-	write_data += from;
-
-	if ((to > PAGE_SIZE) || (from > to)) {
-		kunmap(page);
-		return -EIO;
-	}
-
-	/* racing with truncate? */
-	if (offset > mapping->host->i_size) {
-		kunmap(page);
-		return 0; /* don't care */
-	}
-
-	/* check to make sure that we are not extending the file */
-	if (mapping->host->i_size - offset < (loff_t)to)
-		to = (unsigned)(mapping->host->i_size - offset);
-
-	rc = cifs_get_writable_file(CIFS_I(mapping->host), FIND_WR_ANY,
-				    &open_file);
-	if (!rc) {
-		bytes_written = cifs_write(open_file, open_file->pid,
-					   write_data, to - from, &offset);
-		cifsFileInfo_put(open_file);
-		/* Does mm or vfs already set times? */
-		simple_inode_init_ts(inode);
-		if ((bytes_written > 0) && (offset))
-			rc = 0;
-		else if (bytes_written < 0)
-			rc = bytes_written;
-		else
-			rc = -EFAULT;
-	} else {
-		cifs_dbg(FYI, "No writable handle for write page rc=%d\n", rc);
-		if (!is_retryable_error(rc))
-			rc = -EIO;
-	}
-
-	kunmap(page);
-	return rc;
-}
-
 /*
  * Extend the region to be written back to include subsequent contiguously
  * dirty pages if possible, but don't sleep while doing so.
@@ -3047,47 +2989,6 @@ static int cifs_writepages(struct address_space *mapping,
 	return ret;
 }
 
-static int
-cifs_writepage_locked(struct page *page, struct writeback_control *wbc)
-{
-	int rc;
-	unsigned int xid;
-
-	xid = get_xid();
-/* BB add check for wbc flags */
-	get_page(page);
-	if (!PageUptodate(page))
-		cifs_dbg(FYI, "ppw - page not up to date\n");
-
-	/*
-	 * Set the "writeback" flag, and clear "dirty" in the radix tree.
-	 *
-	 * A writepage() implementation always needs to do either this,
-	 * or re-dirty the page with "redirty_page_for_writepage()" in
-	 * the case of a failure.
-	 *
-	 * Just unlocking the page will cause the radix tree tag-bits
-	 * to fail to update with the state of the page correctly.
-	 */
-	set_page_writeback(page);
-retry_write:
-	rc = cifs_partialpagewrite(page, 0, PAGE_SIZE);
-	if (is_retryable_error(rc)) {
-		if (wbc->sync_mode == WB_SYNC_ALL && rc == -EAGAIN)
-			goto retry_write;
-		redirty_page_for_writepage(wbc, page);
-	} else if (rc != 0) {
-		SetPageError(page);
-		mapping_set_error(page->mapping, rc);
-	} else {
-		SetPageUptodate(page);
-	}
-	end_page_writeback(page);
-	put_page(page);
-	free_xid(xid);
-	return rc;
-}
-
 static int cifs_write_end(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
@@ -4913,27 +4814,6 @@ static void cifs_invalidate_folio(struct folio *folio, size_t offset,
 	folio_wait_private_2(folio); /* [DEPRECATED] */
 }
 
-static int cifs_launder_folio(struct folio *folio)
-{
-	int rc = 0;
-	loff_t range_start = folio_pos(folio);
-	loff_t range_end = range_start + folio_size(folio);
-	struct writeback_control wbc = {
-		.sync_mode = WB_SYNC_ALL,
-		.nr_to_write = 0,
-		.range_start = range_start,
-		.range_end = range_end,
-	};
-
-	cifs_dbg(FYI, "Launder page: %lu\n", folio->index);
-
-	if (folio_clear_dirty_for_io(folio))
-		rc = cifs_writepage_locked(&folio->page, &wbc);
-
-	folio_wait_private_2(folio); /* [DEPRECATED] */
-	return rc;
-}
-
 void cifs_oplock_break(struct work_struct *work)
 {
 	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
@@ -5112,7 +4992,6 @@ const struct address_space_operations cifs_addr_ops = {
 	.release_folio = cifs_release_folio,
 	.direct_IO = cifs_direct_io,
 	.invalidate_folio = cifs_invalidate_folio,
-	.launder_folio = cifs_launder_folio,
 	.migrate_folio = filemap_migrate_folio,
 	/*
 	 * TODO: investigate and if useful we could add an is_dirty_writeback
@@ -5135,6 +5014,5 @@ const struct address_space_operations cifs_addr_ops_smallbuf = {
 	.dirty_folio = netfs_dirty_folio,
 	.release_folio = cifs_release_folio,
 	.invalidate_folio = cifs_invalidate_folio,
-	.launder_folio = cifs_launder_folio,
 	.migrate_folio = filemap_migrate_folio,
 };
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index 91b07ef9e25c..468ea2312a1a 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -2430,24 +2430,6 @@ cifs_dentry_needs_reval(struct dentry *dentry)
 	return false;
 }
 
-/*
- * Zap the cache. Called when invalid_mapping flag is set.
- */
-int
-cifs_invalidate_mapping(struct inode *inode)
-{
-	int rc = 0;
-
-	if (inode->i_mapping && inode->i_mapping->nrpages != 0) {
-		rc = invalidate_inode_pages2(inode->i_mapping);
-		if (rc)
-			cifs_dbg(VFS, "%s: invalidate inode %p failed with rc %d\n",
-				 __func__, inode, rc);
-	}
-
-	return rc;
-}
-
 /**
  * cifs_wait_bit_killable - helper for functions that are sleeping on bit locks
  *
@@ -2484,9 +2466,12 @@ cifs_revalidate_mapping(struct inode *inode)
 		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RW_CACHE)
 			goto skip_invalidate;
 
-		rc = cifs_invalidate_mapping(inode);
-		if (rc)
+		rc = filemap_invalidate_inode(inode, true);
+		if (rc) {
+			cifs_dbg(VFS, "%s: invalidate inode %p failed with rc %d\n",
+				 __func__, inode, rc);
 			set_bit(CIFS_INO_INVALID_MAPPING, flags);
+		}
 	}
 
 skip_invalidate:

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

