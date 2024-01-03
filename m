Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBM526WAMGQEUR4PGTQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F68236FC
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 22:15:51 +0100 (CET)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6dc03cc7dd6sf3961973a34.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 13:15:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704316550; cv=pass;
        d=google.com; s=arc-20160816;
        b=oxH+2LH2OFW/lwPd+FJuQKVwrpmD39JV1Eln3CiOTWpetFDJCyVYSALKyfjYr6+fKk
         a6EvTLNLtr4aWST+UlrFSNT5FiziVTO3PnZorScT/Vr67uj8+VioUbqjvzfsy6KMxIts
         i5dnT1R75jc3YHzhaZVyxHFq0VkyWRtkNR5UpvGcRNcKow5z7K8/9AquJJsNqnNAQKCt
         mmNAwj9RHtiORyo6PA/9tbc69/aBP/ApZiR/Rbt2aJFSINStr/C9aSx4Nvo6mRV5MsCS
         n5FKreBYupiFy9zZKwCb8JTQ9Aj0V4bpQZlLDEGb4uQx14fjEw9lRHB79reJ8JL8IooV
         Dd8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=iIXyIW+yhxHFZbUYPzRW6IqjoCnCz5tjHYuPHVwW2q8=;
        fh=RmbPpkHmWa19yDO2vJJHN4v6F4YRs/BfubrAZaLoLKU=;
        b=Ah6/neMtmtgqjO9B/GJszLckvOnYbT6lPrw2n8PeK+qf9FKFWFvKWOrW8VbsREt1Qz
         h1XT125o8VuIzcnVRGN8UBDM65RkcrK3mZmv6L5L0px7nSkjLmSTJBURcsEw93+1mC2e
         v89x6IJA6s3wgkBSNdmE+KTz5Ug4qAz2EjvevwaFu5UGpW0VlbOHJMNmyhK03gk8rmP1
         r9yGmFotvcqhB7awHDNwj4TYWDj8rMfvtldNyo1reiQ/bq31cW1KUXHT7tTN496AD+9u
         /s3paLrpiq11V9SngWiSannuoVpRPTLUm2//Tx70b9qOHIFsIxZGAT+58YncKS336a8T
         p46w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704316550; x=1704921350;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIXyIW+yhxHFZbUYPzRW6IqjoCnCz5tjHYuPHVwW2q8=;
        b=L9oZqDnrJ5xX20DXeC/5HV/V6ijuvSUscoOdh+EqFpmyl1+jZqtNtYyWu1PCkDOAXl
         HiQp8VM85evK6DYjVMJ9IIQXn8fGDvD2v/jEyYmeJDTZ3iPb0qpF2varaWrpZcMl4bLz
         lA/PzoeXEc+sPR2+dvrjWHGZduF6lsborwrhqOa4JsaK7SeWiSwEg3V+u2avYGvydFeU
         apOToi5RlIAvu4nnPOrtj/j5BAmsSB3hnrgx6NYMqxYMxP0nhZlLo/gptrfRAafOZcjC
         OtwcJN6wBy8xghmoUAuUcJ05cK69MPDtnIu241+nwKC7V0csMFpYAvQOQ0jb87Uxdj0I
         bnJg==
X-Gm-Message-State: AOJu0YwYqcs2QTPK9ZSKcNX1UM3ycJNcndS43gpRzith/wg/Z/Vw5sWH
	6j9MTW/HEMscnC64U0KQdHpI+JDProu/yQ==
X-Google-Smtp-Source: AGHT+IG8Zxfd81W6S43BHSXogrJSmtOzCtP1eUypqwiIjOnES00XqN3ieTw19NjLcQQZm428vnNCNg==
X-Received: by 2002:a9d:480b:0:b0:6dc:64b:4cf8 with SMTP id c11-20020a9d480b000000b006dc064b4cf8mr5424477otf.68.1704316549591;
        Wed, 03 Jan 2024 13:15:49 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:454c:0:b0:428:29:430 with SMTP id z12-20020ac8454c000000b0042800290430ls6603233qtn.1.-pod-prod-06-us;
 Wed, 03 Jan 2024 13:15:49 -0800 (PST)
X-Received: by 2002:ae9:c213:0:b0:781:8b74:cf41 with SMTP id j19-20020ae9c213000000b007818b74cf41mr10003097qkg.13.1704316548967;
        Wed, 03 Jan 2024 13:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704316548; cv=none;
        d=google.com; s=arc-20160816;
        b=qWGj7eX1OZ/2Zde9O25Z1zkyoUocMBp3OzO3Pl1dSmxN7myon3HRsXmCauOGnhuPZN
         Vd9/g1Qxur8WHUBgKJ8w0niB6ExE+XxiPfLLghorEZT1IGncwmnLuOOZ8pAB4uYsmrrD
         JMwU/MnLn+5aZ0mOf2rk0VTQm05as58Kx9+MZOuZccqfeAHG0tWYtoKpyyYSZ69vm6Ec
         FN7c3DAgUI+qk2SwXZt+e8oijtqaY1dNOvc0L7stI2pM9w76vZ/HNu8JCIrjDl3Ymu+4
         0tRdL12bXbTGHcX6+6Qk5k5BK7zXaUlNvuVD8W5jfn3Kdk0bXHXL79YXu6QAQaZ9gFv2
         SDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=Lz9BpuJT9ZqjBzLEQFTtycxe4tbIVPZFPrNygtaFHDI=;
        fh=RmbPpkHmWa19yDO2vJJHN4v6F4YRs/BfubrAZaLoLKU=;
        b=OiQH3pARo6xbVm7/XihUVa810ADkJO9BTsUTY1E+mRUz2aFcNLJodkME2koabSkHLx
         I8L/62AnPOVjANU9nGp8nQGl4enIOE2jXksPJzOJ/V23tC+vy2w5fdX5XFNjBD4zPfLP
         x1tjHsnays07K0wri6yFuyZg9YWG001JHmpt7FNfPGVYKiIMOJ1MkoZ5JDm+GguUt7mJ
         P75Qp29m0Vj3x2Qs9Z27TF1bsLMmboTbZ9ib7K3lhrPEu0AEhWXUfKGxpW0ub1URSndF
         cek2O+jblQsar5lC3RUfCT1RoO2nQSgZ18XDc4jVJSXBKnGcRx39R+20klMt+aGzzOz5
         smFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id va23-20020a05620a3f9700b007811e17de8esi30182010qkn.313.2024.01.03.13.15.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 13:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-CCQ72IHEPO6mN6rk5n-0Kg-1; Wed, 03 Jan 2024 16:15:47 -0500
X-MC-Unique: CCQ72IHEPO6mN6rk5n-0Kg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57FC7185A785
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 21:15:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 54EAF492BC7; Wed,  3 Jan 2024 21:15:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 576BF492BC6;
	Wed,  3 Jan 2024 21:15:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Marc Dionne <marc.dionne@auristor.com>
Cc: dhowells@redhat.com, Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-erofs@lists.ozlabs.org,
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/5] netfs: Fix proc/fs/fscache symlink to point to "netfs" not "../netfs"
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 21:15:43 +0000
Message-ID: <900277.1704316543@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <900276.1704316543.1@warthog.procyon.org.uk>
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

Fix the proc/fs/fscache symlink to point to "netfs" not "../netfs".

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Christian Brauner <christian@brauner.io>
cc: linux-fsdevel@vger.kernel.org
cc: linux-cachefs@redhat.com
---
 fs/netfs/fscache_proc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/fscache_proc.c b/fs/netfs/fscache_proc.c
index ecd0d1edafaa..874d951bc390 100644
--- a/fs/netfs/fscache_proc.c
+++ b/fs/netfs/fscache_proc.c
@@ -16,7 +16,7 @@
  */
 int __init fscache_proc_init(void)
 {
-	if (!proc_symlink("fs/fscache", NULL, "../netfs"))
+	if (!proc_symlink("fs/fscache", NULL, "netfs"))
 		goto error_sym;
 
 	if (!proc_create_seq("fs/netfs/caches", S_IFREG | 0444, NULL,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

