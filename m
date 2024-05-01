Return-Path: <linux-cachefs+bncBDLIXLMFVAERBU7KZGYQMGQEXQP5W4Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC338B8EAB
	for <lists+linux-cachefs@lfdr.de>; Wed,  1 May 2024 19:01:08 +0200 (CEST)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-de610854b8bsf4773225276.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 01 May 2024 10:01:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714582867; cv=pass;
        d=google.com; s=arc-20160816;
        b=fMagwa4+Qb51bTMiuwJqlUX416men4M74gGg8wJfzBnN8PBkRtJbBw0CGV9qbOtKyw
         0FG51JoNl3226l8Pgb6/BvCpzgY+B8Vy1fgf217oynOlvIy8VxLiScPq6f6S6XpOtNvR
         ixfqQ4togZBpPoFUuuvpdr9eNlIeMXBNdQMGDirmCOjZ1IKSaQkg88WGwu9bZnBIaI+s
         6WgdyqZekZPnQD6LO0znCZMz2TXu691Gy0nsyPLdhahu4h3b+LbXASmq8ztVZ+d5aEJY
         3REshX2/khCMlXpcSuw2VNuLPBAzD5ZuiGAk4/EeSVqTnbUre+4E5yMtBkPDFs1XcYiN
         mpUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=OTwCcU43b4lL1TIcqy3AIMN1F0c7LtSbZ5EizvM9ny4=;
        fh=R1mhGPLiGovbw6TcQBGAopbZbX5c/kLQCK6sWtWSldQ=;
        b=yACmy5ImBwfPw6+lEImSnyVlZ9hCPgVfX9bMn2dWQhMTfmbz5wBm6G3s2ewp2ZXJzC
         fY5QzWuIyie+T0s1pWVghOoIuEBeVvxO+1qR4exa3cETBOtb0nA7sSR5NrMHJrEaX5TL
         C3vUuCBwHD61XyyVM/kdb4WuSU8HzAzfsDFx1eZYpwnJscp1KLM8+1kOA/+6ff85hV0+
         mHq8g+XGccLcpeID9mBHEMHbFsFy7y5HNV9DcDZktiCQPwIqVKgaVwdlNlKEgfLtVP8S
         OY3K+i24kpmRCEKr3HmneyMrPGPBniMNRWTYbck1nZMLuNlCzyQCtv5jMbIvtUgY2vJP
         ncKA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714582867; x=1715187667;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTwCcU43b4lL1TIcqy3AIMN1F0c7LtSbZ5EizvM9ny4=;
        b=uzhNdAze7ka9hO8felT+8adcp+NHzvSnWgTSGAq+l/VOngCqGBFXcrAg0HHPG9oa/x
         l+dJptVQBZCh3aUQHYhpKgGA7nnmta20/p4lkrojxyE7tdCvXKUvQ6soPQkTPMgiecM0
         PgZwZAP1C22jUA5uidkVDODi+DXAO0COsi0iuaeBfjt7ZR3TCyk5a4p3zmJhayFM8azR
         /WsiMMR2pG55X4g1rT+WLyrpJ/u9fN0mhMnnG5bcOvqrRCOHVSUVbBrphw+L56GLv6sk
         Wo52a+rPI3rxreQpWp4wBON1/i8iMX83wsR4ttO6aCZPyfEx2nVMv2+oSwHX2YspA+y5
         oNMQ==
X-Forwarded-Encrypted: i=2; AJvYcCXLbDIG8WZi8E3six6ta4twnw5y9UgoPI8wkNk92hxo4JIz6KxjRf59DdJFQ5QJoAxZymht3VIunErq6G1OkFHqKcDj8IW/k3Cy9BU=
X-Gm-Message-State: AOJu0YwR3ksCXluePPf1ydPL6mt9vcfbKMcty6Q6j9Ih8nLYNDRRnAOI
	aaMOXdOivwEWFDtfgoh5cL2bOPIScYiCo30ISDYfP/PG+gfoisuKxz15u/RyHHU=
X-Google-Smtp-Source: AGHT+IHNb7YillTd95GNLOw+Cep1mUObNg5ipM+BUVq+g6vDlaUW6z181VDDDPsGKVFQelviI1zE+g==
X-Received: by 2002:a25:ae51:0:b0:de5:5bca:ecb0 with SMTP id g17-20020a25ae51000000b00de55bcaecb0mr3366292ybe.0.1714582867432;
        Wed, 01 May 2024 10:01:07 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:c742:0:b0:de5:a004:beb with SMTP id 3f1490d57ef6-de8b54a7fc6ls124267276.1.-pod-prod-01-us;
 Wed, 01 May 2024 10:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9PQ/8DKI34Iirx1gq6tRS1BA7UQvmJhsLGaX8Sn5wstpjAosIP8711Jqw22qR0a5roT4dxMRk+kwyVhNsuEY+MPxkt2zBARUENHCCr3c=
X-Received: by 2002:a25:874a:0:b0:de6:e4d:e990 with SMTP id e10-20020a25874a000000b00de60e4de990mr3101816ybn.37.1714582866360;
        Wed, 01 May 2024 10:01:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714582866; cv=none;
        d=google.com; s=arc-20160816;
        b=KIP+D5P+NmM1l8/e10+ujS/URkCkwWNLNIgjtV6ZSEZ6BgsWtXrzwv6Xc/aj0WvBif
         zZhR1N0oZL84f+Yg+jlem502oGDVOeAkTj2ihrxeUXCZ/IkI1IMU9LZHeOKpx5eEnymb
         tDkTl69HLRL8HdVQkpObQE35jC79rOxMOxSYgEV+vAHp1ANZGumsPGGIRi38TLtsqrwQ
         4h93yl5oC6b/vcgJmGPL0Gl0XHN75Be/ZUFa/BNXMHYKQKOiDYP9nYVkO3IQh38CUA//
         JcOAvCpOaajx3OOIPLWPUW1WSKEViNiHy1pwSlZmoCT2ckbMp4dKvmcr7praIw1oT5sx
         OPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=0yplg81trxImBt7j5O9rAoRgAvC27niU93my+9EHulg=;
        fh=0CIerLb/cM50vy7gQm3XRz1x4J6a65cahl3DlMj5j9E=;
        b=JAO88I0Xd8vIJXViYU1mFuMdHJTC4y0ttnjYIFQNX8wnI2Lkz1wEinMy6YGAqC8mxF
         It3wWtpVvOic/B8dmluwS/vyvD/vtYxuUHxIc/saFS9Aju6s9MObulBLDABaryuq3uRq
         ygPplGIQb0z5Ls4ZINk5l4UVA1KUcABQmVh7/4tJJiaJ5D/NEwpXSRTPFiUYsrRmwZOx
         FbBtoCve0ZrDVSAWTGunwcxV3fBtHJ7SA6jfz6CIPx/qJfkJdkk9X0+Pl4FvSWx53rkV
         bvUuatl1dDqUc7o3VdzZB+41AoGY4Xpq2b4w0rbuciF5n6YQpz5Xy6t7YeUC/JASWzta
         US4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id x7-20020a25ac87000000b00de8a2fb334dsi479422ybi.280.2024.05.01.10.01.06
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-bw-5txdfPvKf-JdwosK8kg-1; Wed,
 01 May 2024 13:01:04 -0400
X-MC-Unique: bw-5txdfPvKf-JdwosK8kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 374FC3C000B1
	for <linux-cachefs@gapps.redhat.com>; Wed,  1 May 2024 17:01:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 343252166B34; Wed,  1 May 2024 17:01:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 512842166B31;
	Wed,  1 May 2024 17:01:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-15-dhowells@redhat.com>
References: <20240430140056.261997-15-dhowells@redhat.com> <20240430140056.261997-1-dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH v2 14/22] netfs: New writeback implementation
MIME-Version: 1.0
Date: Wed, 01 May 2024 18:00:59 +0100
Message-ID: <458060.1714582859@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <458059.1714582859.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

This needs the attached change.  It needs to allow for netfs_perform_write()
changing i_size whilst we're doing writeback.  The issue is that i_size is
cached in the netfs_io_request struct (as that's what we're going to tell the
server the new i_size should be), but we're not updating this properly if
i_size moves between us creating the request and us deciding to write out the
folio in which i_size was when we created the request.

This can lead to the folio_zero_segment() that can be seen in the patch below
clearing the wrong amount of the final page - assuming it's still the final
page.

David
---
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index 69c50f4cbf41..e190043bc0da 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -315,13 +315,19 @@ static int netfs_write_folio(struct netfs_io_request *wreq,
 	struct netfs_group *fgroup; /* TODO: Use this with ceph */
 	struct netfs_folio *finfo;
 	size_t fsize = folio_size(folio), flen = fsize, foff = 0;
-	loff_t fpos = folio_pos(folio);
+	loff_t fpos = folio_pos(folio), i_size;
 	bool to_eof = false, streamw = false;
 	bool debug = false;
 
 	_enter("");
 
-	if (fpos >= wreq->i_size) {
+	/* netfs_perform_write() may shift i_size around the page or from out
+	 * of the page to beyond it, but cannot move i_size into or through the
+	 * page since we have it locked.
+	 */
+	i_size = i_size_read(wreq->inode);
+
+	if (fpos >= i_size) {
 		/* mmap beyond eof. */
 		_debug("beyond eof");
 		folio_start_writeback(folio);
@@ -332,6 +338,9 @@ static int netfs_write_folio(struct netfs_io_request *wreq,
 		return 0;
 	}
 
+	if (fpos + fsize > wreq->i_size)
+		wreq->i_size = i_size;
+
 	fgroup = netfs_folio_group(folio);
 	finfo = netfs_folio_info(folio);
 	if (finfo) {
@@ -342,14 +351,14 @@ static int netfs_write_folio(struct netfs_io_request *wreq,
 
 	if (wreq->origin == NETFS_WRITETHROUGH) {
 		to_eof = false;
-		if (flen > wreq->i_size - fpos)
-			flen = wreq->i_size - fpos;
-	} else if (flen > wreq->i_size - fpos) {
-		flen = wreq->i_size - fpos;
+		if (flen > i_size - fpos)
+			flen = i_size - fpos;
+	} else if (flen > i_size - fpos) {
+		flen = i_size - fpos;
 		if (!streamw)
 			folio_zero_segment(folio, flen, fsize);
 		to_eof = true;
-	} else if (flen == wreq->i_size - fpos) {
+	} else if (flen == i_size - fpos) {
 		to_eof = true;
 	}
 	flen -= foff;

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

