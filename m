Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3PTYOYQMGQE7R5WZTY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C728B77EE
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:22 +0200 (CEST)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256sf9415819276.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485741; cv=pass;
        d=google.com; s=arc-20160816;
        b=tcY3oiq7j80LYLeEMeOivSlSrNU4/ih5lF0x9WkMlDtyXxtp5QdbaXmzour49f0loB
         cUXw+dNXp+yeShC/Zgaa03aQe/wi9TxTWfGmhVpjAexantGnD9Bb7OLnBN3C2uHOaasI
         V1bd6Ynads12B5q9IMO9G2x6nFEnn2OyXJeigdxWgDcfe04BEy6941+XM/fi/hhT17tK
         +dRAai9AuVIDUr0vbW1OiSDp8vFjkWGNvgJXmNbClgy6FgJEBNaO6WjKDv+CnKU9rVvA
         7Lq1YpU2E+NUoT5+xtrcgP7y2mrY8vi5n6FzKpDe9Tyko2YtHo+A4QjSjgECkkWjOSet
         13Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TOUa79rpq4qUz0FHhLR1lV6WL1quHrQ+pG+hoqNCW/I=;
        fh=8q1z7ddyi1HTCmwv4s73qWUyBRsY5ymkhX5AMI/OPcg=;
        b=Ymw+f1pmCwkeqbSUxdXkgifo+1BHmTX8+e1fd/yxUGjXt9jihr542pqMILUJ+kPHS3
         lVbQhu2dHUEuJkWdNC2AWTyj774KPjAvf2k6O4yX6Z9XTz27BJjsEuokvw4vM1dzbmaL
         Cqgcg2Nu3veTcqbGnHrsiJ2Jz3kBMtOvs8KRztmHdZVSUhwGSmZWi+RNO93lb7iIpmWc
         pOFzpkWl4/ODxk3h35Q0AUssCf4743Y9Yq1397U3rFWsVMSs8NX1mf8EYqzzcf3YUwBi
         G0mOWkyI4fp2NfCCgkQdBGe2w702FVqtFrs0cUcEcvEzLQqKkcFs0f62fV7C0AEljBJL
         igzA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485741; x=1715090541;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOUa79rpq4qUz0FHhLR1lV6WL1quHrQ+pG+hoqNCW/I=;
        b=VOcm6P49lO2QNF7eLSt0f8XMkcsow8EyQCCEIG+wZGA/udfjI6wROcxd8ECb03kBPS
         iPObnMgC2XUllZMBhSnQdBZRLh03+cy3EJKfKvqPPx2rVmmBL2ka/N3wsR2LkU4xGHn8
         LeYXM+4O76Q8v0TTZdVitcXq+KPj/LHDNubdd8LxetZLh97icj9+3+eENitXlNXNWNgq
         mbjPZMr1Xb2YZzLSqaWmL4DvZzfkm0LKI8hMjLt551mw8US2m68VLwh2MbyjkW8lVg4O
         h38pPapF3puetK0WztYp4Q4cQUGRjWq8QS+EzhOG8OPVGg8buk1vnEc0luIiuvtssQSY
         1/1g==
X-Forwarded-Encrypted: i=2; AJvYcCUYp6AjOdROdj4TBb8/UbLc2ndkDgcLWgZ/Fa+Ct0YveIGy6GjRViU9OSUdJtjZ30izmcCQbJiHAhvBpp3lO3SdgOpP1zige1YxdGU=
X-Gm-Message-State: AOJu0YxAQIRG3DYu2+KIkuAOtEiagHatY0qBKYLq2+lzxUKugZ6Lki0k
	TuUKj5n1MN4a+qC0Nh33vXGToX6kw4T6biBxnUKZa3A6ZEw/uGFFs5o9EiPwT7k=
X-Google-Smtp-Source: AGHT+IEuQzGybxYTfUOzwSJ/IvjIiG1uXcWe/wpwNd9vQgcQEZ8z7SsJFRyhGF4lh+/1n2VhZ2lykg==
X-Received: by 2002:a25:bfc8:0:b0:de0:d515:259b with SMTP id q8-20020a25bfc8000000b00de0d515259bmr3021781ybm.59.1714485741420;
        Tue, 30 Apr 2024 07:02:21 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:aa71:0:b0:de6:c21:3462 with SMTP id 3f1490d57ef6-de60c21356cls1073056276.0.-pod-prod-03-us;
 Tue, 30 Apr 2024 07:02:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOWiQoGYH7ATjC6pHPzmM+G2AbGlI4uqXfle7NIHzV7l3OPiV9djNQrkgQoiMV/5embnPd4sKQ4SRFkTHzQRVyVqYmq0AFZvCeAF5vlb0=
X-Received: by 2002:a25:a022:0:b0:de5:4eef:542d with SMTP id x31-20020a25a022000000b00de54eef542dmr2603541ybh.57.1714485739755;
        Tue, 30 Apr 2024 07:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485739; cv=none;
        d=google.com; s=arc-20160816;
        b=iq6aaYOb4uNkl3oXYMea+eXsSEyNJIIrXX1YoFUoh0qg2im0bT/uTPELcOoH6pUdNo
         kQqvuFbK/28NWMF1iAOZkgzNfVAZMr9Eh9/r0sl/XfosbS+u3m3AbyOL7JyQ2Ty0uEEO
         dWmhra3b0PCOS6u5W5a/FZ1pK9k8fU6fmQuHhTKMgbnL+TLUJVrMdR4BvPAa5Y4+mi2i
         aBu2C+aPqfLEjd5/i72Lvz7HDvXOIA2n8RLp2Z2Nkqq7ZunBelSWrjUofCt2Nokvqyc4
         XPHYtoCcao2pT7JIt+fdtiiGdn6WoQnPlVl/Pnc3wV7euwDVuvEM3YbEs31s0wCnp+1X
         BHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=RVKnlQo0k8LYSKy/5xkID19zXhvzF8VfogUxkP/ClX8=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=jVX4H9CfhRxPJxZxop7gioSpQDADuItIAWfTIgJ5c3nshcmrMrV1B30161sGEWQUV8
         hOjTak53AxRgwhzTz9kpcpvJERprunuxX1qOVmRYGOpoNFHJX/HIJndkVwRkuVt1S1Yu
         HlHog5v0r+r23ZFDMx9q/dUhqSyBieDmYdO2wF75iGCxKGFDZ1V0Q5hdohBkJSsBi5Xm
         e9Jx7z8NH1ESnJnhpHKosydspKRMKDiCKUuadbt9H1NNrCICDNPt91vsf5Ufvaz7hCF0
         69W1qZzM7CRchmepx9b05nJO/EFb8cs0h0HY6ApWR0ZM9Y44p+j9XPS5s8mGEHriWHFd
         TbnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g203-20020a25dbd4000000b00de604d76245si1047486ybf.358.2024.04.30.07.02.19
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-3-oJOhfMOoa_8F3nQXkdZA-1; Tue,
 30 Apr 2024 10:02:17 -0400
X-MC-Unique: 3-oJOhfMOoa_8F3nQXkdZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 586F21C4C3B0
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 53B4E100A841; Tue, 30 Apr 2024 14:02:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 417FE1121312;
	Tue, 30 Apr 2024 14:02:09 +0000 (UTC)
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
Subject: [PATCH v2 16/22] netfs, afs: Implement helpers for new write code
Date: Tue, 30 Apr 2024 15:00:47 +0100
Message-ID: <20240430140056.261997-17-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Implement the helpers for the new write code in afs.  There's now an
optional ->prepare_write() that allows the filesystem to set the parameters
for the next write, such as maximum size and maximum segment count, and an
->issue_write() that is called to initiate an (asynchronous) write
operation.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---

Notes:
    Changes
    =======
    ver #2)
     - Don't do the StoreData RPC inline, but keep doing it from a workqueue.

 fs/afs/file.c     |  3 +++
 fs/afs/internal.h |  3 +++
 fs/afs/write.c    | 54 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index dfd8f60f5e1f..db9ebae84fa2 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -400,6 +400,9 @@ const struct netfs_request_ops afs_req_ops = {
 	.update_i_size		= afs_update_i_size,
 	.invalidate_cache	= afs_netfs_invalidate_cache,
 	.create_write_requests	= afs_create_write_requests,
+	.begin_writeback	= afs_begin_writeback,
+	.prepare_write		= afs_prepare_write,
+	.issue_write		= afs_issue_write,
 };
 
 static void afs_add_open_mmap(struct afs_vnode *vnode)
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index b93aa026daa4..dcf0ae0323d3 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1598,6 +1598,9 @@ extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 /*
  * write.c
  */
+void afs_prepare_write(struct netfs_io_subrequest *subreq);
+void afs_issue_write(struct netfs_io_subrequest *subreq);
+void afs_begin_writeback(struct netfs_io_request *wreq);
 extern int afs_writepages(struct address_space *, struct writeback_control *);
 extern int afs_fsync(struct file *, loff_t, loff_t, int);
 extern vm_fault_t afs_page_mkwrite(struct vm_fault *vmf);
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 1bc26466eb72..34595f482718 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -194,6 +194,60 @@ void afs_create_write_requests(struct netfs_io_request *wreq, loff_t start, size
 		netfs_queue_write_request(subreq);
 }
 
+/*
+ * Writeback calls this when it finds a folio that needs uploading.  This isn't
+ * called if writeback only has copy-to-cache to deal with.
+ */
+void afs_begin_writeback(struct netfs_io_request *wreq)
+{
+	wreq->io_streams[0].avail = true;
+}
+
+/*
+ * Prepare a subrequest to write to the server.  This sets the max_len
+ * parameter.
+ */
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
+static void afs_issue_write_worker(struct work_struct *work)
+{
+	struct netfs_io_subrequest *subreq = container_of(work, struct netfs_io_subrequest, work);
+	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
+	ssize_t ret;
+
+	_enter("%x[%x],%zx",
+	       subreq->rreq->debug_id, subreq->debug_index, subreq->io_iter.count);
+
+#if 0 // Error injection
+	if (subreq->debug_index == 3)
+		return netfs_write_subrequest_terminated(subreq, -ENOANO, false);
+
+	if (!test_bit(NETFS_SREQ_RETRYING, &subreq->flags)) {
+		set_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
+		return netfs_write_subrequest_terminated(subreq, -EAGAIN, false);
+	}
+#endif
+
+	ret = afs_store_data(vnode, &subreq->io_iter, subreq->start);
+	netfs_write_subrequest_terminated(subreq, ret < 0 ? ret : subreq->len, false);
+}
+
+void afs_issue_write(struct netfs_io_subrequest *subreq)
+{
+	subreq->work.func = afs_issue_write_worker;
+	if (!queue_work(system_unbound_wq, &subreq->work))
+		WARN_ON_ONCE(1);
+}
+
 /*
  * write some of the pending data back to the server
  */

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

