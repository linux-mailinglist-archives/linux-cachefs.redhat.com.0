Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3FQ36VAMGQES2XLROQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E1E7EF9A3
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:33 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b3f893e38asf3066137b6e.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255852; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hxmolsi4zk2XqtqN0PL6aPJCg/l4n2sU8Z3J4/W33eNTF8c8txCB5rYhhxxM9kRVmJ
         uJN1b8wyxu7KjgLsMUTA7uZQGzTT1HOKLh7O7+ZQMJRseIeIPMkln13BqE2Zzj1JQe5j
         gQq2hyhM9aZi3+O7XF+61ksl4T0beePLKUM1+kAESPXZ3T+xNYIkb3AYKbLN56NM0nx9
         N7dPt4ovQTDjM+miFHIx+qf+xiASUVBdehswvcprQXXonmN95PtkJmRpJbrJWC76s6G/
         3UGvIepF5vghrB/m4lmRvZabzv+WZD4ChdahLG0LA8lOveEpjHWDd5Xjocebmaeajjty
         oMAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3JbElJ/ljlzIwYW37WBpeJPWX0BCNRtXMM4FGqnrQSE=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=sRWwa6NUHsgsY7r7veP84x7qcYgypVzMOrk8D37XHXw9kSd3vCtuYp/9Z6x9lUQpAa
         8k1tMpYfAYDIgGYzcRZlSebXKR9QrAbmCCNrSBEluPGzKXiBGAgVAuXJTMi/hjLK/2Nl
         0eOzaF3Xv0jdlIphuk8PADF4jAHuO8riZTZj68BQ/ET1/MH7ZAqSOfOxNbkbpDbopLaw
         yHb9TyAT+R6B7+zJq7zLlYJD9rc109BCKA4W8vXWNRyWE+T8FXviUPQ69p4MCUMHo1Cl
         gdw+1QalVBPCL66BlFhJnKZAQkomgyyIk9vy+xreIUx4BvmfYK2ir3IUGp2Ifa1Wdjt7
         Ef+A==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255852; x=1700860652;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JbElJ/ljlzIwYW37WBpeJPWX0BCNRtXMM4FGqnrQSE=;
        b=VweIx5vSBpxC7PaAa/J6LSy3hYdXK1nyScGENPo8G74YkZ9NLlbqZVA3zOndSKbVYV
         M9wSFxAc6c9MirERDqB4Qqq6n0pI7gnSciBhMD97bfr2NKXPhvFsNqvkBMAknyNFF7fh
         cCWWyuqx2/uHQHXPKEYrjrKZv0uYeB74S3lIKD0oVjjieQ5DXiUEVnKDcdN3Eo1Gns6T
         TAz1yxqkPLNkQISldJRkhHgRygahPQuDq/pyaC2Bc60yC2EakSgZxJ2MXII6girg9C//
         swlUTGb54BZx0IwHx7lJAG0Kl6x97stwNJ8Im7y3Iy/wMNh4GxjepCOusUP1QjLLJBI2
         NTgw==
X-Gm-Message-State: AOJu0YxK7mkzmUKT1LQKI1te74QRFUlra4+sl415QM5tAqMV8YSCn1rT
	uHNfYmPAuft5ojzkJ6w1qKxkOg==
X-Google-Smtp-Source: AGHT+IFY/M+Qmqe9Yk9K1TQ4jK0THvz+SZn+aIyMs56FfwE91C+Nu++4YuzXBRozq06ABPJyqEjh0A==
X-Received: by 2002:a05:6870:8929:b0:1e9:96c6:e04c with SMTP id i41-20020a056870892900b001e996c6e04cmr433230oao.32.1700255852299;
        Fri, 17 Nov 2023 13:17:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7d02:0:b0:41f:157e:89e5 with SMTP id g2-20020ac87d02000000b0041f157e89e5ls1923690qtb.0.-pod-prod-03-us;
 Fri, 17 Nov 2023 13:17:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a0c:b0:76f:1076:3b43 with SMTP id bk12-20020a05620a1a0c00b0076f10763b43mr952725qkb.1.1700255851683;
        Fri, 17 Nov 2023 13:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255851; cv=none;
        d=google.com; s=arc-20160816;
        b=JKT1WUoNv5WmfdmkzFHvR9/j7HlqeqxBQhXhKVvT/LXUp0KJnqd77kwS4sMoAZWcgQ
         edvMv5YQVjAKr9zpgN6rjy7Xqzb+I2MwIcAZWuomShsIwI3LuC6w6lkErqNVZMcRCMwW
         XAk59qd5sJSQaOausVRYvBUuzM9/D5FwlbfDin4Y7xmZg6A0I5c5R0V0RQ6XwY+enYu+
         /It3MiotTuttrzNJwu1hoB6eyrt/y4746M/3v6H2H6ta4/2pTgzEtHW2MtWe03C00ARl
         8Fpis7Ma9Wk3w48ChU1jYKNI5NgdZJwk1V4ivTI19GfobHaDys+XlsN8P90OSKZDXUCL
         Co3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YCXtE3Gqov3oA1rKgjLh+er5qsDXpT3dWhNn5qjdKp8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=v5aqarWsET7AJRpYWwKm8GMFecRJesrQmFBvHh7ixRh53mWz7NE8ORSkVe6svQYrN1
         ZIlNkc5cB8IfUOYcMO/G3+Y+fwq3ba4ObdQAJDuCSPdgou4Iu4CVxJIK8ZTMSvTRZpDS
         SGqdQ+uKFob7QVa7RRbvQj55+9cnfHcaQf4sJwG1pTs51zBhIdWtGEl3DYOi73D4z4kk
         mmkZHyL5joyivTXIQKDTPC4Tl21Lvt42HhtDI2GetHiJJJO1ItpuCy8+HOp0Umhu2QUs
         s8NjF16/7CGNniOCT+tyyDIeNRZFxy26O30ukpBHY2W9pvz+lF3iSTwTI0NjQYAPTUyA
         ojig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id vv18-20020a05620a563200b00767d57590f5si2342950qkn.455.2023.11.17.13.17.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-UvXnzU6jMnOs_17CsF9xGQ-1; Fri, 17 Nov 2023 16:17:30 -0500
X-MC-Unique: UvXnzU6jMnOs_17CsF9xGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA8C785A5BD
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C40F31121308; Fri, 17 Nov 2023 21:17:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 234291121306;
	Fri, 17 Nov 2023 21:17:27 +0000 (UTC)
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
Subject: [PATCH v2 24/51] netfs: Allocate multipage folios in the writepath
Date: Fri, 17 Nov 2023 21:15:16 +0000
Message-ID: <20231117211544.1740466-25-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Allocate a multipage folio when copying data into the pagecache if possible
if there's sufficient data to warrant it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 406c3f3666fa..4de6a12149e4 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -84,14 +84,19 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 }
 
 /*
- * Grab a folio for writing and lock it.
+ * Grab a folio for writing and lock it.  Attempt to allocate as large a folio
+ * as possible to hold as much of the remaining length as possible in one go.
  */
 static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
 						loff_t pos, size_t part)
 {
 	pgoff_t index = pos / PAGE_SIZE;
+	fgf_t fgp_flags = FGP_WRITEBEGIN;
 
-	return __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+	if (mapping_large_folio_support(mapping))
+		fgp_flags |= fgf_set_order(pos % PAGE_SIZE + part);
+
+	return __filemap_get_folio(mapping, index, fgp_flags,
 				   mapping_gfp_mask(mapping));
 }
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

