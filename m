Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFH2SCWAMGQEZF6O23I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E02381B78D
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:45 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d87bcf8a15sf913765a34.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165204; cv=pass;
        d=google.com; s=arc-20160816;
        b=0uHSxyAl8y6VUUzZ9FiEusw/9iOc3BZLErByXRc28RHPglQ6HoDLSyUAZS8ujAZ/PD
         D2KPNSIzKBYPhIMFPJTBiF0uPxCwNyCDxRqryRvHymQWB000mWKolGsnCSKBGN1rWRfi
         qDCLFCoGgoRiFwaApAJKEu/emdxP2uNEBcgdYyquH3lV5ORpFGJvE9nungbw5CRaSD9N
         WrL0BoYIBiHTPfV8Xf6kqQdLbN/+HqD8cR558Yborl61uKXxCoHC1BJA/aLpwkce5LXZ
         cpPCMn4kHOuzV9kYm7qS+Tewp3z5m2LIHV+j/mfzfSEMZh413b/DhoF4jOa2tCdTzsNd
         Gz+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lunK/Nz2VMeyyEvZCrjeVFRzkUBo/lHXWplYaD5SNM0=;
        fh=t+jO56dkL9X4EA2io20PfIsFWjr1fkJwesfm41Ljqzo=;
        b=aTqbGIdFDM5AOT1j9/AmwqMpC3vI3M3i9IZyzWEmoZ+ALI25/ivs706OQnobRqRGjQ
         2QpAwWSBwGq87JQjkAdphc9aCZASndKWzwwIvgTyOLnL5HYW+HvHV67axoNgeiZ6x8rK
         bnonElSYU7LUZGi3Ty2fkBMQzzqq8nS1W0Qa7cbRj1Ea+PRV8eGxRSmInSQFDWfNVc3/
         slZpDbzZSfHX5Ad8y+XqkIDUaNhWdaR0l8mYS9bokHXCFcuo9GDZnrbCbz+pYoh3NUbK
         ZLM1H+ApQi8rYS1eky64aG2y6oZrbeIN72/B+/ZytTxc8rTXQhLCo5CSpQOo0+Cu07Lu
         NcfA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165204; x=1703770004;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lunK/Nz2VMeyyEvZCrjeVFRzkUBo/lHXWplYaD5SNM0=;
        b=IBNgokXeL0ynYXkV4ZJd/V8I2HoHs76HhxmTs9QCh6Gm3LjWECju+lo5a0c3FGZP0O
         McsNli1effzStEhz85wNwinXGW0IF95i7RoEvsG0LbjihCSKeh/Z3z7NeEJ49pG7hCfV
         8eSR2G0i75nyRTagK2N/djgqcMj53DD0HulP/PzVF1pwTe+OqzLo81IUg+XfWjEPT0zM
         2/5JdcN3eiNogj2dlzjjR4X6/RvzSJPUFg8O4K5BIOcMN+LB4hW2C+y+vCBveX+/imor
         /EL+sLmCTHAsHaE61JJ470vwIMgacS4q5uw7J/IyjWSU+JI89ETDu3rVJXfDa2Ga+KGd
         SzeA==
X-Gm-Message-State: AOJu0Yy4l/oKs3ndzSuXYPhTv0PH7hpZGWuQaCqLElYahuKHLIHsX1cw
	eV1tbG9JwkH8lXT1y3ism2Hbtg==
X-Google-Smtp-Source: AGHT+IG3qWNYgtSUFVWu8XbDYauS0g4FNSYNu7Q+moNuctpM3NllVjGUvtCtj+698uTKJmo5OdW2gw==
X-Received: by 2002:a05:6830:2098:b0:6db:a6cf:5121 with SMTP id y24-20020a056830209800b006dba6cf5121mr3989285otq.7.1703165204272;
        Thu, 21 Dec 2023 05:26:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:71d5:0:b0:423:a0d4:8c61 with SMTP id i21-20020ac871d5000000b00423a0d48c61ls1319254qtp.2.-pod-prod-09-us;
 Thu, 21 Dec 2023 05:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:780:e026:bdce with SMTP id o6-20020a05620a2a0600b00780e026bdcemr10018129qkp.136.1703165203738;
        Thu, 21 Dec 2023 05:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165203; cv=none;
        d=google.com; s=arc-20160816;
        b=fNW1jSM2HBCRilWkoeMg2tQJzAbQZ5cbKsYQDF4Rl06410hrbdiME0gKiUCq/N0GiX
         Pxhkz2L78EXagAiV8FJS4LMgXLpYyYBXSwY3m1jVhESRXahHsbdCR85EojmSd2/EjdxC
         VTOODcIHNf6m8L4G8x/J/Nv7NsxM3fhgp3KbbnKQleqn2bE2+z1NeEmvGA3RsDppZZHU
         3FWbanEj6uckKovqQiqGagORO0Rhrpjwf+e6H1ktRVWCpGCn1ibqL+L2cdhRmk1Aa0iI
         X3/bos/ZmhPz8T/c/LomWoI5Krhw1I51CgbDuy51TmYSQ8o2C3i6ZAO/VdJxmV3HlNVj
         ALJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VsVDmWf3bHekjbj+Ntt1kyKt3F5oWDO+qfCCvuK/nws=;
        fh=t+jO56dkL9X4EA2io20PfIsFWjr1fkJwesfm41Ljqzo=;
        b=bHa6Te1lo3Jkq8AlJzFkbXwjf85Z26pzGy6DoJ38gukyMPNMdCBNhBc6NQ5nAqkLsC
         Tbrqta/rkqy3C3ksR/WXgytOT59N0Gh46oUt0Lzkq107MWHpigsDzE56Rk8TpBykyuVI
         Sy0WY9rr0XY9z3qU8uQ3YKO2dxbdy0izUKtyJFF5I5koQZnmEiqBXWbkXln2u5SHVmcf
         q5wXccySGQex2eLXeD4CvK6CDDUvX3v43vEg65Kw5BAGeSnR6mJVAHwFT60ZgkgGYH7Q
         8xlBb84sV8AsQouXx+Nsh+I+GSHx6rVpfD9NtCf3VlZ3/OdROvpQbEivVqhqloEVnZiW
         /LbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id vr3-20020a05620a55a300b0078119dd3fafsi2042209qkn.780.2023.12.21.05.26.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-PlUJhwGDMBCHdW9qCV3F2w-1; Thu,
 21 Dec 2023 08:26:41 -0500
X-MC-Unique: PlUJhwGDMBCHdW9qCV3F2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F5AD280D46B
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 87B99112132A; Thu, 21 Dec 2023 13:26:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABB11121313;
	Thu, 21 Dec 2023 13:26:37 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH v5 40/40] 9p: Use netfslib read/write_iter
Date: Thu, 21 Dec 2023 13:23:35 +0000
Message-ID: <20231221132400.1601991-41-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Use netfslib's read and write iteration helpers, allowing netfslib to take
over the management of the page cache for 9p files and to manage local disk
caching.  In particular, this eliminates write_begin, write_end, writepage
and all mentions of struct page and struct folio from 9p.

Note that netfslib now offers the possibility of write-through caching if
that is desirable for 9p: just set the NETFS_ICTX_WRITETHROUGH flag in
v9inode->netfs.flags in v9fs_set_netfs_context().

Note also this is untested as I can't get ganesha.nfsd to correctly parse
the config to turn on 9p support.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---

Notes:
    Changes
    =======
    ver #5)
     - Added some missing remote_i_size setting.
     - Added missing writepages (else mmap write never written back).

 fs/9p/vfs_addr.c       | 293 ++++++++++-------------------------------
 fs/9p/vfs_file.c       |  89 ++-----------
 fs/9p/vfs_inode.c      |   5 +-
 fs/9p/vfs_inode_dotl.c |   7 +-
 4 files changed, 85 insertions(+), 309 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 055b672a247d..20f072c18ce9 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -19,12 +19,48 @@
 #include <linux/netfs.h>
 #include <net/9p/9p.h>
 #include <net/9p/client.h>
+#include <trace/events/netfs.h>
 
 #include "v9fs.h"
 #include "v9fs_vfs.h"
 #include "cache.h"
 #include "fid.h"
 
+static void v9fs_upload_to_server(struct netfs_io_subrequest *subreq)
+{
+	struct inode *inode = subreq->rreq->inode;
+	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
+	struct p9_fid *fid = subreq->rreq->netfs_priv;
+	int err;
+
+	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
+	p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
+	netfs_write_subrequest_terminated(subreq, err < 0 ? err : subreq->len,
+					  false);
+}
+
+static void v9fs_upload_to_server_worker(struct work_struct *work)
+{
+	struct netfs_io_subrequest *subreq =
+		container_of(work, struct netfs_io_subrequest, work);
+
+	v9fs_upload_to_server(subreq);
+}
+
+/*
+ * Set up write requests for a writeback slice.  We need to add a write request
+ * for each write we want to make.
+ */
+static void v9fs_create_write_requests(struct netfs_io_request *wreq, loff_t start, size_t len)
+{
+	struct netfs_io_subrequest *subreq;
+
+	subreq = netfs_create_write_request(wreq, NETFS_UPLOAD_TO_SERVER,
+					    start, len, v9fs_upload_to_server_worker);
+	if (subreq)
+		netfs_queue_write_request(subreq);
+}
+
 /**
  * v9fs_issue_read - Issue a read from 9P
  * @subreq: The read to make
@@ -33,14 +69,10 @@ static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
 {
 	struct netfs_io_request *rreq = subreq->rreq;
 	struct p9_fid *fid = rreq->netfs_priv;
-	struct iov_iter to;
-	loff_t pos = subreq->start + subreq->transferred;
-	size_t len = subreq->len   - subreq->transferred;
 	int total, err;
 
-	iov_iter_xarray(&to, ITER_DEST, &rreq->mapping->i_pages, pos, len);
-
-	total = p9_client_read(fid, pos, &to, &err);
+	total = p9_client_read(fid, subreq->start + subreq->transferred,
+			       &subreq->io_iter, &err);
 
 	/* if we just extended the file size, any portion not in
 	 * cache won't be on server and is zeroes */
@@ -50,23 +82,37 @@ static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
 }
 
 /**
- * v9fs_init_request - Initialise a read request
+ * v9fs_init_request - Initialise a request
  * @rreq: The read request
  * @file: The file being read from
  */
 static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 {
-	struct p9_fid *fid = file->private_data;
-
-	BUG_ON(!fid);
+	struct p9_fid *fid;
+	bool writing = (rreq->origin == NETFS_READ_FOR_WRITE ||
+			rreq->origin == NETFS_WRITEBACK ||
+			rreq->origin == NETFS_WRITETHROUGH ||
+			rreq->origin == NETFS_LAUNDER_WRITE ||
+			rreq->origin == NETFS_UNBUFFERED_WRITE ||
+			rreq->origin == NETFS_DIO_WRITE);
+
+	if (file) {
+		fid = file->private_data;
+		BUG_ON(!fid);
+		p9_fid_get(fid);
+	} else {
+		fid = v9fs_fid_find_inode(rreq->inode, writing, INVALID_UID, true);
+		if (!fid) {
+			WARN_ONCE(1, "folio expected an open fid inode->i_private=%p\n",
+				  rreq->inode->i_private);
+			return -EINVAL;
+		}
+	}
 
 	/* we might need to read from a fid that was opened write-only
 	 * for read-modify-write of page cache, use the writeback fid
 	 * for that */
-	WARN_ON(rreq->origin == NETFS_READ_FOR_WRITE &&
-			!(fid->mode & P9_ORDWR));
-
-	p9_fid_get(fid);
+	WARN_ON(writing && !(fid->mode & P9_ORDWR));
 	rreq->netfs_priv = fid;
 	return 0;
 }
@@ -86,217 +132,16 @@ const struct netfs_request_ops v9fs_req_ops = {
 	.init_request		= v9fs_init_request,
 	.free_request		= v9fs_free_request,
 	.issue_read		= v9fs_issue_read,
+	.create_write_requests	= v9fs_create_write_requests,
 };
 
-#ifdef CONFIG_9P_FSCACHE
-static void v9fs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
-				     bool was_async)
-{
-	struct v9fs_inode *v9inode = priv;
-	__le32 version;
-
-	if (IS_ERR_VALUE(transferred_or_error) &&
-	    transferred_or_error != -ENOBUFS) {
-		version = cpu_to_le32(v9inode->qid.version);
-		fscache_invalidate(v9fs_inode_cookie(v9inode), &version,
-				   i_size_read(&v9inode->netfs.inode), 0);
-	}
-}
-#endif
-
-static int v9fs_vfs_write_folio_locked(struct folio *folio)
-{
-	struct inode *inode = folio_inode(folio);
-	loff_t start = folio_pos(folio);
-	loff_t i_size = i_size_read(inode);
-	struct iov_iter from;
-	size_t len = folio_size(folio);
-	struct p9_fid *writeback_fid;
-	int err;
-	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
-	struct fscache_cookie __maybe_unused *cookie = v9fs_inode_cookie(v9inode);
-
-	if (start >= i_size)
-		return 0; /* Simultaneous truncation occurred */
-
-	len = min_t(loff_t, i_size - start, len);
-
-	iov_iter_xarray(&from, ITER_SOURCE, &folio_mapping(folio)->i_pages, start, len);
-
-	writeback_fid = v9fs_fid_find_inode(inode, true, INVALID_UID, true);
-	if (!writeback_fid) {
-		WARN_ONCE(1, "folio expected an open fid inode->i_private=%p\n",
-			inode->i_private);
-		return -EINVAL;
-	}
-
-	folio_wait_fscache(folio);
-	folio_start_writeback(folio);
-
-	p9_client_write(writeback_fid, start, &from, &err);
-
-#ifdef CONFIG_9P_FSCACHE
-	if (err == 0 &&
-		fscache_cookie_enabled(cookie) &&
-		test_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags)) {
-		folio_start_fscache(folio);
-		fscache_write_to_cache(v9fs_inode_cookie(v9inode),
-					folio_mapping(folio), start, len, i_size,
-					v9fs_write_to_cache_done, v9inode,
-					true);
-	}
-#endif
-
-	folio_end_writeback(folio);
-	p9_fid_put(writeback_fid);
-
-	return err;
-}
-
-static int v9fs_vfs_writepage(struct page *page, struct writeback_control *wbc)
-{
-	struct folio *folio = page_folio(page);
-	int retval;
-
-	p9_debug(P9_DEBUG_VFS, "folio %p\n", folio);
-
-	retval = v9fs_vfs_write_folio_locked(folio);
-	if (retval < 0) {
-		if (retval == -EAGAIN) {
-			folio_redirty_for_writepage(wbc, folio);
-			retval = 0;
-		} else {
-			mapping_set_error(folio_mapping(folio), retval);
-		}
-	} else
-		retval = 0;
-
-	folio_unlock(folio);
-	return retval;
-}
-
-static int v9fs_launder_folio(struct folio *folio)
-{
-	int retval;
-
-	if (folio_clear_dirty_for_io(folio)) {
-		retval = v9fs_vfs_write_folio_locked(folio);
-		if (retval)
-			return retval;
-	}
-	folio_wait_fscache(folio);
-	return 0;
-}
-
-/**
- * v9fs_direct_IO - 9P address space operation for direct I/O
- * @iocb: target I/O control block
- * @iter: The data/buffer to use
- *
- * The presence of v9fs_direct_IO() in the address space ops vector
- * allowes open() O_DIRECT flags which would have failed otherwise.
- *
- * In the non-cached mode, we shunt off direct read and write requests before
- * the VFS gets them, so this method should never be called.
- *
- * Direct IO is not 'yet' supported in the cached mode. Hence when
- * this routine is called through generic_file_aio_read(), the read/write fails
- * with an error.
- *
- */
-static ssize_t
-v9fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
-{
-	struct file *file = iocb->ki_filp;
-	loff_t pos = iocb->ki_pos;
-	ssize_t n;
-	int err = 0;
-
-	if (iov_iter_rw(iter) == WRITE) {
-		n = p9_client_write(file->private_data, pos, iter, &err);
-		if (n) {
-			struct inode *inode = file_inode(file);
-			loff_t i_size = i_size_read(inode);
-
-			if (pos + n > i_size)
-				inode_add_bytes(inode, pos + n - i_size);
-		}
-	} else {
-		n = p9_client_read(file->private_data, pos, iter, &err);
-	}
-	return n ? n : err;
-}
-
-static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
-			    loff_t pos, unsigned int len,
-			    struct page **subpagep, void **fsdata)
-{
-	int retval;
-	struct folio *folio;
-	struct v9fs_inode *v9inode = V9FS_I(mapping->host);
-
-	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
-
-	/* Prefetch area to be written into the cache if we're caching this
-	 * file.  We need to do this before we get a lock on the page in case
-	 * there's more than one writer competing for the same cache block.
-	 */
-	retval = netfs_write_begin(&v9inode->netfs, filp, mapping, pos, len, &folio, fsdata);
-	if (retval < 0)
-		return retval;
-
-	*subpagep = &folio->page;
-	return retval;
-}
-
-static int v9fs_write_end(struct file *filp, struct address_space *mapping,
-			  loff_t pos, unsigned int len, unsigned int copied,
-			  struct page *subpage, void *fsdata)
-{
-	loff_t last_pos = pos + copied;
-	struct folio *folio = page_folio(subpage);
-	struct inode *inode = mapping->host;
-
-	p9_debug(P9_DEBUG_VFS, "filp %p, mapping %p\n", filp, mapping);
-
-	if (!folio_test_uptodate(folio)) {
-		if (unlikely(copied < len)) {
-			copied = 0;
-			goto out;
-		}
-
-		folio_mark_uptodate(folio);
-	}
-
-	/*
-	 * No need to use i_size_read() here, the i_size
-	 * cannot change under us because we hold the i_mutex.
-	 */
-	if (last_pos > inode->i_size) {
-		inode_add_bytes(inode, last_pos - inode->i_size);
-		i_size_write(inode, last_pos);
-#ifdef CONFIG_9P_FSCACHE
-		fscache_update_cookie(v9fs_inode_cookie(V9FS_I(inode)), NULL,
-			&last_pos);
-#endif
-	}
-	folio_mark_dirty(folio);
-out:
-	folio_unlock(folio);
-	folio_put(folio);
-
-	return copied;
-}
-
 const struct address_space_operations v9fs_addr_operations = {
-	.read_folio	= netfs_read_folio,
-	.readahead	= netfs_readahead,
-	.dirty_folio	= netfs_dirty_folio,
-	.writepage	= v9fs_vfs_writepage,
-	.write_begin	= v9fs_write_begin,
-	.write_end	= v9fs_write_end,
-	.release_folio	= netfs_release_folio,
-	.invalidate_folio = netfs_invalidate_folio,
-	.launder_folio	= v9fs_launder_folio,
-	.direct_IO	= v9fs_direct_IO,
+	.read_folio		= netfs_read_folio,
+	.readahead		= netfs_readahead,
+	.dirty_folio		= netfs_dirty_folio,
+	.release_folio		= netfs_release_folio,
+	.invalidate_folio	= netfs_invalidate_folio,
+	.launder_folio		= netfs_launder_folio,
+	.direct_IO		= noop_direct_IO,
+	.writepages		= netfs_writepages,
 };
diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 11cd8d23f6f2..bae330c2f0cf 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -353,25 +353,15 @@ static ssize_t
 v9fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct p9_fid *fid = iocb->ki_filp->private_data;
-	int ret, err = 0;
 
 	p9_debug(P9_DEBUG_VFS, "fid %d count %zu offset %lld\n",
 		 fid->fid, iov_iter_count(to), iocb->ki_pos);
 
-	if (!(fid->mode & P9L_DIRECT)) {
-		p9_debug(P9_DEBUG_VFS, "(cached)\n");
-		return generic_file_read_iter(iocb, to);
-	}
-
-	if (iocb->ki_filp->f_flags & O_NONBLOCK)
-		ret = p9_client_read_once(fid, iocb->ki_pos, to, &err);
-	else
-		ret = p9_client_read(fid, iocb->ki_pos, to, &err);
-	if (!ret)
-		return err;
+	if (fid->mode & P9L_DIRECT)
+		return netfs_unbuffered_read_iter(iocb, to);
 
-	iocb->ki_pos += ret;
-	return ret;
+	p9_debug(P9_DEBUG_VFS, "(cached)\n");
+	return netfs_file_read_iter(iocb, to);
 }
 
 /*
@@ -407,46 +397,14 @@ v9fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct p9_fid *fid = file->private_data;
-	ssize_t retval;
-	loff_t origin;
-	int err = 0;
 
 	p9_debug(P9_DEBUG_VFS, "fid %d\n", fid->fid);
 
-	if (!(fid->mode & (P9L_DIRECT | P9L_NOWRITECACHE))) {
-		p9_debug(P9_DEBUG_CACHE, "(cached)\n");
-		return generic_file_write_iter(iocb, from);
-	}
+	if (fid->mode & (P9L_DIRECT | P9L_NOWRITECACHE))
+		return netfs_unbuffered_write_iter(iocb, from);
 
-	retval = generic_write_checks(iocb, from);
-	if (retval <= 0)
-		return retval;
-
-	origin = iocb->ki_pos;
-	retval = p9_client_write(file->private_data, iocb->ki_pos, from, &err);
-	if (retval > 0) {
-		struct inode *inode = file_inode(file);
-		loff_t i_size;
-		unsigned long pg_start, pg_end;
-
-		pg_start = origin >> PAGE_SHIFT;
-		pg_end = (origin + retval - 1) >> PAGE_SHIFT;
-		if (inode->i_mapping && inode->i_mapping->nrpages)
-			invalidate_inode_pages2_range(inode->i_mapping,
-						      pg_start, pg_end);
-		iocb->ki_pos += retval;
-		i_size = i_size_read(inode);
-		if (iocb->ki_pos > i_size) {
-			inode_add_bytes(inode, iocb->ki_pos - i_size);
-			/*
-			 * Need to serialize against i_size_write() in
-			 * v9fs_stat2inode()
-			 */
-			v9fs_i_size_write(inode, iocb->ki_pos);
-		}
-		return retval;
-	}
-	return err;
+	p9_debug(P9_DEBUG_CACHE, "(cached)\n");
+	return netfs_file_write_iter(iocb, from);
 }
 
 static int v9fs_file_fsync(struct file *filp, loff_t start, loff_t end,
@@ -519,36 +477,7 @@ v9fs_file_mmap(struct file *filp, struct vm_area_struct *vma)
 static vm_fault_t
 v9fs_vm_page_mkwrite(struct vm_fault *vmf)
 {
-	struct folio *folio = page_folio(vmf->page);
-	struct file *filp = vmf->vma->vm_file;
-	struct inode *inode = file_inode(filp);
-
-
-	p9_debug(P9_DEBUG_VFS, "folio %p fid %lx\n",
-		 folio, (unsigned long)filp->private_data);
-
-	/* Wait for the page to be written to the cache before we allow it to
-	 * be modified.  We then assume the entire page will need writing back.
-	 */
-#ifdef CONFIG_9P_FSCACHE
-	if (folio_test_fscache(folio) &&
-	    folio_wait_fscache_killable(folio) < 0)
-		return VM_FAULT_NOPAGE;
-#endif
-
-	/* Update file times before taking page lock */
-	file_update_time(filp);
-
-	if (folio_lock_killable(folio) < 0)
-		return VM_FAULT_RETRY;
-	if (folio_mapping(folio) != inode->i_mapping)
-		goto out_unlock;
-	folio_wait_stable(folio);
-
-	return VM_FAULT_LOCKED;
-out_unlock:
-	folio_unlock(folio);
-	return VM_FAULT_NOPAGE;
+	return netfs_page_mkwrite(vmf, NULL);
 }
 
 static void v9fs_mmap_vm_close(struct vm_area_struct *vma)
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index 74122540e00f..55345753ae8d 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -374,10 +374,8 @@ void v9fs_evict_inode(struct inode *inode)
 
 	truncate_inode_pages_final(&inode->i_data);
 
-#ifdef CONFIG_9P_FSCACHE
 	version = cpu_to_le32(v9inode->qid.version);
 	netfs_clear_inode_writeback(inode, &version);
-#endif
 
 	clear_inode(inode);
 	filemap_fdatawrite(&inode->i_data);
@@ -1112,7 +1110,7 @@ static int v9fs_vfs_setattr(struct mnt_idmap *idmap,
 	if ((iattr->ia_valid & ATTR_SIZE) &&
 		 iattr->ia_size != i_size_read(inode)) {
 		truncate_setsize(inode, iattr->ia_size);
-		truncate_pagecache(inode, iattr->ia_size);
+		netfs_resize_file(netfs_inode(inode), iattr->ia_size, true);
 
 #ifdef CONFIG_9P_FSCACHE
 		if (v9ses->cache & CACHE_FSCACHE) {
@@ -1180,6 +1178,7 @@ v9fs_stat2inode(struct p9_wstat *stat, struct inode *inode,
 	mode |= inode->i_mode & ~S_IALLUGO;
 	inode->i_mode = mode;
 
+	v9inode->netfs.remote_i_size = stat->length;
 	if (!(flags & V9FS_STAT2INODE_KEEP_ISIZE))
 		v9fs_i_size_write(inode, stat->length);
 	/* not real number of blocks, but 512 byte ones ... */
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index c7319af2f471..e25fbc988f09 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -598,7 +598,7 @@ int v9fs_vfs_setattr_dotl(struct mnt_idmap *idmap,
 	if ((iattr->ia_valid & ATTR_SIZE) && iattr->ia_size !=
 		 i_size_read(inode)) {
 		truncate_setsize(inode, iattr->ia_size);
-		truncate_pagecache(inode, iattr->ia_size);
+		netfs_resize_file(netfs_inode(inode), iattr->ia_size, true);
 
 #ifdef CONFIG_9P_FSCACHE
 		if (v9ses->cache & CACHE_FSCACHE)
@@ -655,6 +655,7 @@ v9fs_stat2inode_dotl(struct p9_stat_dotl *stat, struct inode *inode,
 		mode |= inode->i_mode & ~S_IALLUGO;
 		inode->i_mode = mode;
 
+		v9inode->netfs.remote_i_size = stat->st_size;
 		if (!(flags & V9FS_STAT2INODE_KEEP_ISIZE))
 			v9fs_i_size_write(inode, stat->st_size);
 		inode->i_blocks = stat->st_blocks;
@@ -683,8 +684,10 @@ v9fs_stat2inode_dotl(struct p9_stat_dotl *stat, struct inode *inode,
 			inode->i_mode = mode;
 		}
 		if (!(flags & V9FS_STAT2INODE_KEEP_ISIZE) &&
-		    stat->st_result_mask & P9_STATS_SIZE)
+		    stat->st_result_mask & P9_STATS_SIZE) {
+			v9inode->netfs.remote_i_size = stat->st_size;
 			v9fs_i_size_write(inode, stat->st_size);
+		}
 		if (stat->st_result_mask & P9_STATS_BLOCKS)
 			inode->i_blocks = stat->st_blocks;
 	}

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

