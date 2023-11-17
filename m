Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEVQ36VAMGQECDSN3IY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDBE7EF957
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:04 +0100 (CET)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6d646a0d9bfsf2228058a34.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255763; cv=pass;
        d=google.com; s=arc-20160816;
        b=mmGz+3e4i+vYNGU6z2U+MiwjByppzvz57J0tj2mjAojdGW8CJ7LzHrllQH+r84fO7w
         uPhT2J3NNYdTn5tmXSB0bEEnIYOoR0Ji/36fxGPruOV8N5MViM+T5HnqA+kWK1ecFohb
         UdW4MWickLYgqb15R/JggCRRvof7tiLrWZ9NqvXfPQnQBgUyYtInabm39B7ROpmATk2K
         9pji58UWgBkDccd4kCRjLKQkEU8TUqz28dJUmRNPjjVmfk+2f2TWzHqfYmpzUb4PlSEr
         ig8xMByXNx7xw4ofrpkLU6QQDLUkYlOVf/zMiSQc/EtWd1C0cX37dCUm19g/xFudq8Y8
         /kMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BJ3vOThKmuPrz7fd9bhvERvBPG9+2lsrTPR+0eOs+6w=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=zCJ5Dh0YIg+Oqct2UvUW90XXzZH5WPU6sGhllgj6qOJEPw0uEcDxU5/zD5PPy0YRx3
         6Y2rWXQh78j20eAfWYdeh1jgxPkJp8uVIRQ/lu6gyv5HHig+0f1Xglw/2+ZTXKOjqtSj
         i0QjlWDP+NPGxNSTfMKSu+Nkg4aWuvtfot2BG1qtD0Qx5Rfkulnug3dqPYejL2pjHERc
         DWFiq8+jKA0j+ASQtwnqd9wkalKPgEp/NKqoXAk6H1F4nfmw595AbGJCBBs+Rdg6yIr8
         fqUzOuueHQZAhvSwg77VEI956hMkB0krLruAyRk6sUJc8oGWvNzeT2YTB1V3F96NAKXy
         HREg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255763; x=1700860563;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ3vOThKmuPrz7fd9bhvERvBPG9+2lsrTPR+0eOs+6w=;
        b=MzUH1XYajHxqU2O9j+xBiwsVuzWlDgl/J+cCMeoLs6d/t7/sntPnLx6Ue/qWby9uEP
         qIxZFwXr9SSG5vE+VX+3OUaXPpQQhTo+Ed4N3twquAEuU5ahvteJt3XJWZVwLMYjQCqX
         jMLUotYqroFpe9SnyGxHUFvXJqJRWCpV8k4rGIEqaPxkZRtIfzi8R77EtUQxw30TracM
         L9Aacn9ve7kvQOX8GyTeaAlyvzyf/8AAUA2MzYp9kQe4DobzdmOOuKoR+t2MiJx6uSsY
         QbDGjPUol2iEzIYhxTQGYpceqaVxKfHr4ebTt+c7gwebtSln/NfBp88+D2/4jtqclN4m
         FGCA==
X-Gm-Message-State: AOJu0YztJoABDhmfRf1qnNJxKPr53aFzgEN+AOhlM3qOonBIZQOdPI29
	aOq+9wHw5hB5rW9kHISZiGMRIA==
X-Google-Smtp-Source: AGHT+IGnuEE3+lYhAxd+zD2wUfsdJ7UWZVhym0HAsWiIcOHn52xlJNeme8PxYZP86Q13CfCRw+ibPw==
X-Received: by 2002:a05:6870:d204:b0:1e9:a741:44f3 with SMTP id g4-20020a056870d20400b001e9a74144f3mr569252oac.14.1700255763038;
        Fri, 17 Nov 2023 13:16:03 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:7609:b0:1e9:d67e:3eae with SMTP id
 ob9-20020a056871760900b001e9d67e3eaels1867147oac.0.-pod-prod-08-us; Fri, 17
 Nov 2023 13:16:02 -0800 (PST)
X-Received: by 2002:a05:6870:80c9:b0:1f5:c306:4262 with SMTP id r9-20020a05687080c900b001f5c3064262mr577661oab.53.1700255761874;
        Fri, 17 Nov 2023 13:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255761; cv=none;
        d=google.com; s=arc-20160816;
        b=G1AaB5j1l92qYI8eu6T/FXnbLjCxzyVe1ZK6KVDvuMh/9msfRcpweF++JT9pZbdEyS
         AVG2GJ5cj8XnJkF8+zA5IuhbPKd5SswNFACYddubw/UofcI06Zj6f022lEJEJBv4Z2H+
         zashlslvQ1veVJG6Cnfw3GkT07jR6ysPCpLyglaj1aW1oLEFFnJ6ZgOV008D619JZ7kH
         IBruVjUbN1NCHmC04XkH/DVtz9HCP4eU16h9qlsocOkBtke76quWfWzgwL2ns41/QwMw
         VBY2b3jSCDTFbyf1sg7YE5P2fNn/2DnygYNUZOubvBXGvDrpaRn2sdWKc76vHDd3LbHe
         7WrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7qvF7oi+5oPEkyJjoyrJDk/ZinoWK2nXUcq9LPlZaNY=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=TpDkB8y8DsOf+BHVnFRLtOiUGAc54yIcrbFAcvcwNDc/KRhccwo/ezs0sb5qllvBi8
         DefXtYdIcT7Bmg50TNoT5j6uoebzzh2ekwLK80Fd/283b1w6V2rkaWImZFqKpB6dYmUW
         KjLS5apTNxMNofJceRVfFHcADgRUidyHKQzaIvM4I4YgVZGjIwfx9TACys3xOKQ/fWGw
         5l8YFbAwnORLCAjZbi/WjAbE95HoAH/CcHLpnD3A6I517PPdRMR1k5HqrswXydSciI1o
         wCxjp2exrJu852G5FXq/bODFW5k4NbaKEWMEggOI1xC5rCo5XGXl56FlJytmZMSXuhR/
         ubvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s33-20020a05622a1aa100b00410a3b28d66si2361261qtc.538.2023.11.17.13.16.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-SjRBni6dNbKMh2uLP6-FIQ-1; Fri, 17 Nov 2023 16:15:59 -0500
X-MC-Unique: SjRBni6dNbKMh2uLP6-FIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84EBA81B560
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:15:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8139C5038; Fri, 17 Nov 2023 21:15:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8DB75036;
	Fri, 17 Nov 2023 21:15:56 +0000 (UTC)
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
Subject: [PATCH v2 03/51] netfs: Allow the netfs to make the io (sub)request alloc larger
Date: Fri, 17 Nov 2023 21:14:55 +0000
Message-ID: <20231117211544.1740466-4-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Allow the network filesystem to specify extra space to be allocated on the
end of the io (sub)request.  This allows cifs, for example, to use this
space rather than allocating its own cifs_readdata struct.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 7 +++++--
 include/linux/netfs.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 85f428fc52e6..c4229c5f3f54 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -22,7 +22,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct netfs_io_request *rreq;
 	int ret;
 
-	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
+		       GFP_KERNEL);
 	if (!rreq)
 		return ERR_PTR(-ENOMEM);
 
@@ -114,7 +115,9 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 {
 	struct netfs_io_subrequest *subreq;
 
-	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	subreq = kzalloc(rreq->netfs_ops->io_subrequest_size ?:
+			 sizeof(struct netfs_io_subrequest),
+			 GFP_KERNEL);
 	if (subreq) {
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 282511090ead..ddd55b35e650 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -212,6 +212,8 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
+	unsigned int	io_request_size;	/* Alloc size for netfs_io_request struct */
+	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

