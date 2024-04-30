Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3XTYOYQMGQEMIMB4DY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E198B77EF
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:23 +0200 (CEST)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-de60cd96bf3sf2412967276.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485742; cv=pass;
        d=google.com; s=arc-20160816;
        b=xHHoNuiNmk9NcF8gF7qm1eEzECNpImXvZ3Ad16u6OVmKOipp1QALu+6jqKn+EB+0lg
         DxZ2UPojV0PF9yBNFUbPYdNEIG+y/EGb53AtlnphHnOsePSFX+p1enNiSudczeO8KOaT
         ksW8lwZ1AU22kcUxTQJrvkBiQkoq3wGOSzoCPxBU61E85WnhxUl4WXcFMiJX+A6cx5iZ
         czRcA70JCutEEq/OQwfqyHFMdi8N1lIg+YEixc2LBCAPZzAJuAyZN0hCZ4RVYX6DUHLz
         5lQVxCjtGoICwFRCUrsDBOoxyYIj80bJI4lHkttHcvCCnDZJ699qnKOoxFuL6+UvAzoy
         qwnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=XtgHZe8/LgAkak/yCTMfjnQmVGgfkWowhIi5ZJ2skvM=;
        fh=paOFtv3TfB9GWF8qVFonKLClzniVOAdxMXNF1gkmdKo=;
        b=TeCk1819MTa7TOfCaRYtsQM0gTVFOE8loF3K02oJYmj/cAlnfgjpEVjtgQ2t7g1uLd
         xjt+NXavReEikbSgr6KA0L481pflOBvcAqsT7U7jVNC2KY5OV5cGt7LlAih1GRBla4eE
         NGuYuTF7btf06lmo/h/wd4LO9VvhScbD7+syOw0U7cOU5v0mcENw/pOSoOfDFl/RBMqA
         zdetDxK2QgvztP/infly7Q+4weHCbhNCT4fA9tPbQDiCpcgSR+l9SNvdrChr0WzP2zVw
         cBdqED0iiRnAdl7CzauzRafvCNMhFqI1Ia/LLDgdROy2TeQFZUKn8Hz+l+MhfOml6LmU
         XLBQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485742; x=1715090542;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtgHZe8/LgAkak/yCTMfjnQmVGgfkWowhIi5ZJ2skvM=;
        b=P26FgT82dIYrrD8V8opvYmDhRNFNwzn9M59k+mihCUzWM0b4uZFw76DbJc3KTZecl4
         gX2RcXU5bnKKJ00dIcs7DaGEBFGr9V8+HLKmL6DrIztQo/vtrO5JvEmSdpDt/CCGJA5D
         6oSEC9lV0bkqjMDydvbKwnZA5nu2BGaquRlpuxHlYkl7KZPqtvuO6/chWW6ekcNyjALK
         nRAI2a85dvPFkUy/BvOAJQjTVLCcjRh9R2X3r/LQIFhZjsnMD1EquUhKVupmNn8J5Oec
         nnA6zden4AQ6W+cTTCQaSchgu/y6I57BhzXl916VD9ca+tY1DrMtLcuGSdrlJ2UAnXga
         YW5g==
X-Forwarded-Encrypted: i=2; AJvYcCXQSuDa8gIA7Y3DKlb+CBHzkoIPiEwo0FPNiAzvwB+6guNQCpXSgbJGiQZtTMcxmjWhn2ELsbh09U3/lhSwockpy/3tya+P/QR3AAI=
X-Gm-Message-State: AOJu0YyTRitObMrkMr26wkSHWS05a8qrIPLJOq7RcKC7KVlgX83FeVNG
	Fokb6HUGVwK/nIZrL3JhPhrCiE6zzzglfeT/w2j8OMs7sn+JGrqAd2xUbvNlbec=
X-Google-Smtp-Source: AGHT+IHD7OwJpeOWrgdDIzUmqnuj6+8IMimr4e1jl4TO0LapD30+ZIxPUbOS2QfWcmcUJMGixVe4mg==
X-Received: by 2002:a25:ea44:0:b0:dc6:5570:898e with SMTP id o4-20020a25ea44000000b00dc65570898emr2043176ybe.17.1714485742561;
        Tue, 30 Apr 2024 07:02:22 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:c583:0:b0:de4:5c70:d1e6 with SMTP id 3f1490d57ef6-de59f2b1766ls149195276.1.-pod-prod-00-us;
 Tue, 30 Apr 2024 07:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfsSXsBJGjwV3MHPvvRl+JVOThXaVf3Lp6IZL44feP8qgbbpMGwQA8E0YpWJ6G7+aS1SiNEA6di1RTOX3hznMxEt0KVyuLx6noYU2hkgM=
X-Received: by 2002:a25:aa89:0:b0:dcc:623e:1b5d with SMTP id t9-20020a25aa89000000b00dcc623e1b5dmr1662797ybi.31.1714485739892;
        Tue, 30 Apr 2024 07:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485739; cv=none;
        d=google.com; s=arc-20160816;
        b=XfTsiUBk+pohV9jktAyxxRGws6+/LJWb6UMJMw6E9AV0cKRHiLMX3nHeCwCOj82Aa7
         limgBDuNHOnbhbQYSWlk6fDe7oOKFS1YOFZmdlslJbRIGDGXgBdNGKIOGNEEzshKzuWD
         QIye9fOmBCx8h4gQ1qoxAWuCrb39HS/NZviaJpEW4sPU774Cdp9q/SxeI+3WZxHk2Ul8
         vcVHfKnKRmhoNhM87rRNH7Yui2vN3dYVBQxvASybt1nUZO8p7+PMPzMNWnBU77vHqpcv
         jEemN5PZ9PMd8p4ucoYws9iEH7s8SB2UohYWLx6UcOq1V518I9fNCeSD1J4GzpUlNkf3
         noGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=vGCt48jeC555R9pX52pBDvHMiG4CZMcxlPULZd6gPmg=;
        fh=MRByWdGD0e7LCOwxmXv5cYQpukVa0xHJcjZh5lBl/ic=;
        b=gSgtpXOXIvVnljpH+4fCiQ0VEieQZJiNydzy8mLar+Ag/x9PLaKvVymuiOF5ydKxja
         NrkFIpqM5dLWT5CNCMyI6ceLTCeehD9SJfHmGizsb9rzHJTueVcOtxFzIbuTl+4mWK7H
         qt1Ye8AlURdU3GmLf3gCH3Yb7Vrvnc5N5Zch+xh2m6KfZUzORmnTIWyHPk2PhKPBTQDu
         KvjRvEweFThZyURH+Pkhl73zBe4B3rw9STunFjv1YydgK2tf/lSRMPGpaNotg6woO80V
         +VotlL+Pde5VwUKWk+KyrLq1tlzoZykG9MNzm+JikKMi/GRFzXVW/IV5vA96xJlUyGLU
         eWpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id v192-20020a252fc9000000b00de60ce046cbsi834265ybv.666.2024.04.30.07.02.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-CmtuGgyNOHOwadaw4XaLYA-1; Tue, 30 Apr 2024 10:02:17 -0400
X-MC-Unique: CmtuGgyNOHOwadaw4XaLYA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 411F98021A5
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3DE90EC681; Tue, 30 Apr 2024 14:02:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1AD6EC680;
	Tue, 30 Apr 2024 14:02:12 +0000 (UTC)
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
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH v2 17/22] netfs, 9p: Implement helpers for new write code
Date: Tue, 30 Apr 2024 15:00:48 +0100
Message-ID: <20240430140056.261997-18-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
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

Implement the helpers for the new write code in 9p.  There's now an
optional ->prepare_write() that allows the filesystem to set the parameters
for the next write, such as maximum size and maximum segment count, and an
->issue_write() that is called to initiate an (asynchronous) write
operation.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---

Notes:
    Changes
    =======
    ver #2)
     - Use 'int len' rather than 'size_t len' because of the varargs packet
       formatter.

 fs/9p/vfs_addr.c        | 48 ++++++++++++++++++++++++++++++++++++++++
 include/net/9p/client.h |  2 ++
 net/9p/Kconfig          |  1 +
 net/9p/client.c         | 49 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 5a943c122d83..07d03efdd594 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -26,6 +26,40 @@
 #include "cache.h"
 #include "fid.h"
 
+/*
+ * Writeback calls this when it finds a folio that needs uploading.  This isn't
+ * called if writeback only has copy-to-cache to deal with.
+ */
+static void v9fs_begin_writeback(struct netfs_io_request *wreq)
+{
+	struct p9_fid *fid;
+
+	fid = v9fs_fid_find_inode(wreq->inode, true, INVALID_UID, true);
+	if (!fid) {
+		WARN_ONCE(1, "folio expected an open fid inode->i_ino=%lx\n",
+			  wreq->inode->i_ino);
+		return;
+	}
+
+	wreq->wsize = fid->clnt->msize - P9_IOHDRSZ;
+	if (fid->iounit)
+		wreq->wsize = min(wreq->wsize, fid->iounit);
+	wreq->netfs_priv = fid;
+	wreq->io_streams[0].avail = true;
+}
+
+/*
+ * Issue a subrequest to write to the server.
+ */
+static void v9fs_issue_write(struct netfs_io_subrequest *subreq)
+{
+	struct p9_fid *fid = subreq->rreq->netfs_priv;
+	int err, len;
+
+	len = p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
+	netfs_write_subrequest_terminated(subreq, len ?: err, false);
+}
+
 static void v9fs_upload_to_server(struct netfs_io_subrequest *subreq)
 {
 	struct p9_fid *fid = subreq->rreq->netfs_priv;
@@ -92,6 +126,14 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 			rreq->origin == NETFS_UNBUFFERED_WRITE ||
 			rreq->origin == NETFS_DIO_WRITE);
 
+#if 0 // TODO: Cut over
+	if (rreq->origin == NETFS_WRITEBACK)
+		return 0; /* We don't get the write handle until we find we
+			   * have actually dirty data and not just
+			   * copy-to-cache data.
+			   */
+#endif
+
 	if (file) {
 		fid = file->private_data;
 		if (!fid)
@@ -103,6 +145,10 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 			goto no_fid;
 	}
 
+	rreq->wsize = fid->clnt->msize - P9_IOHDRSZ;
+	if (fid->iounit)
+		rreq->wsize = min(rreq->wsize, fid->iounit);
+
 	/* we might need to read from a fid that was opened write-only
 	 * for read-modify-write of page cache, use the writeback fid
 	 * for that */
@@ -131,6 +177,8 @@ const struct netfs_request_ops v9fs_req_ops = {
 	.init_request		= v9fs_init_request,
 	.free_request		= v9fs_free_request,
 	.issue_read		= v9fs_issue_read,
+	.begin_writeback	= v9fs_begin_writeback,
+	.issue_write		= v9fs_issue_write,
 	.create_write_requests	= v9fs_create_write_requests,
 };
 
diff --git a/include/net/9p/client.h b/include/net/9p/client.h
index 78ebcf782ce5..4f785098c67a 100644
--- a/include/net/9p/client.h
+++ b/include/net/9p/client.h
@@ -207,6 +207,8 @@ int p9_client_read(struct p9_fid *fid, u64 offset, struct iov_iter *to, int *err
 int p9_client_read_once(struct p9_fid *fid, u64 offset, struct iov_iter *to,
 		int *err);
 int p9_client_write(struct p9_fid *fid, u64 offset, struct iov_iter *from, int *err);
+struct netfs_io_subrequest;
+void p9_client_write_subreq(struct netfs_io_subrequest *subreq);
 int p9_client_readdir(struct p9_fid *fid, char *data, u32 count, u64 offset);
 int p9dirent_read(struct p9_client *clnt, char *buf, int len,
 		  struct p9_dirent *dirent);
diff --git a/net/9p/Kconfig b/net/9p/Kconfig
index 00ebce9e5a65..bcdab9c23b40 100644
--- a/net/9p/Kconfig
+++ b/net/9p/Kconfig
@@ -5,6 +5,7 @@
 
 menuconfig NET_9P
 	tristate "Plan 9 Resource Sharing Support (9P2000)"
+	select NETFS_SUPPORT
 	help
 	  If you say Y here, you will get experimental support for
 	  Plan 9 resource sharing via the 9P2000 protocol.
diff --git a/net/9p/client.c b/net/9p/client.c
index f7e90b4769bb..00774656eeac 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -18,6 +18,7 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
+#include <linux/netfs.h>
 #include <net/9p/9p.h>
 #include <linux/parser.h>
 #include <linux/seq_file.h>
@@ -1661,6 +1662,54 @@ p9_client_write(struct p9_fid *fid, u64 offset, struct iov_iter *from, int *err)
 }
 EXPORT_SYMBOL(p9_client_write);
 
+void
+p9_client_write_subreq(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct p9_fid *fid = wreq->netfs_priv;
+	struct p9_client *clnt = fid->clnt;
+	struct p9_req_t *req;
+	unsigned long long start = subreq->start + subreq->transferred;
+	int written, len = subreq->len - subreq->transferred;
+	int err;
+
+	p9_debug(P9_DEBUG_9P, ">>> TWRITE fid %d offset %llu len %d\n",
+		 fid->fid, start, len);
+
+	/* Don't bother zerocopy for small IO (< 1024) */
+	if (clnt->trans_mod->zc_request && len > 1024) {
+		req = p9_client_zc_rpc(clnt, P9_TWRITE, NULL, &subreq->io_iter,
+				       0, wreq->len, P9_ZC_HDR_SZ, "dqd",
+				       fid->fid, start, len);
+	} else {
+		req = p9_client_rpc(clnt, P9_TWRITE, "dqV", fid->fid,
+				    start, len, &subreq->io_iter);
+	}
+	if (IS_ERR(req)) {
+		netfs_write_subrequest_terminated(subreq, PTR_ERR(req), false);
+		return;
+	}
+
+	err = p9pdu_readf(&req->rc, clnt->proto_version, "d", &written);
+	if (err) {
+		trace_9p_protocol_dump(clnt, &req->rc);
+		p9_req_put(clnt, req);
+		netfs_write_subrequest_terminated(subreq, err, false);
+		return;
+	}
+
+	if (written > len) {
+		pr_err("bogus RWRITE count (%d > %u)\n", written, len);
+		written = len;
+	}
+
+	p9_debug(P9_DEBUG_9P, "<<< RWRITE count %d\n", len);
+
+	p9_req_put(clnt, req);
+	netfs_write_subrequest_terminated(subreq, written, false);
+}
+EXPORT_SYMBOL(p9_client_write_subreq);
+
 struct p9_wstat *p9_client_stat(struct p9_fid *fid)
 {
 	int err;

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

