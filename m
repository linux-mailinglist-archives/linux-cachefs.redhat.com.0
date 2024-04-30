Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOXTYOYQMGQEPLIUNVY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78D8B77D1
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:32 +0200 (CEST)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-23ad2b2b51esf6366977fac.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485691; cv=pass;
        d=google.com; s=arc-20160816;
        b=jGW1m/QT+xlUwNZ8zf5Oqc79cYl1pFCPZZiI6AmLnspkO8fAwJ1JFkxmxL0jqI4jvL
         Oy9xLQohqo2H0lgL3fnw555kzpBI/DB6AJux9lg7FgZUxmLADdjGKKuLhM4ooVPffPVe
         sq+qDkP+KFqvjeQeyY7FDRVVEbR4z2UMajbtY9jmfreFGdCmKtipH7LF6Se3CCa6fnut
         DWvIoGMF6wDTkOwqfJhfdrcwkUCNAPO6pzJcqdaAwR7GF3QVEEzaDJ9J3L0Z53UHesEk
         SJCDy1wi75lbx1Tm/qV8kE4IVEUEc/KnYBhLpKVK02QqKVvthfWe1h72unb9Q9wvHjRF
         KOcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=mokwEr8Ph2XEtNspIPiEDJaA38/4AB6Mgrygi46oNlM=;
        fh=XBN6D8an4rGMZcm3TEuKOPMthEvYv2naUySSNCXxk8w=;
        b=A2HHdhtF2KVpzvC8rjTPeTNO+lYosGd9QDrO9pfiJLqWQiwqTuoL9qUCe4Cy89LSNd
         JpypLElaz1SUYnbVz4i5sDLQhfGdbX7+Vm2pbvfkgLuKaT7CmuTF4qPiGbhiO0KNTm1N
         XbNyfRxAZ9/VV++Wcw11Z8GxstfvxcRkPVZkxd0a6p/cCguAvvHgkY8EVuVVOvXK1NdI
         0lC3EW8fsRc88CGLqYQx7TVGDFkMUVPKgufUiJYj1jWY9fOZQfNU9v2D/RPUYujcqDCf
         VVbVx82lcpqI6yKHh6RHB+k9Vfx5B3CdTCa52pZGmh1HCPZVCazHhseACtR/ChWapm0G
         o6tA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485691; x=1715090491;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mokwEr8Ph2XEtNspIPiEDJaA38/4AB6Mgrygi46oNlM=;
        b=CLa99JZhdOuTjQbMYGuXph18uXSqud/dVyJshAe7UG3HvfumwNNJTVWpXY4E6kl0c2
         CPTIMRqSHovlJjOvVOm4ML06/0iK9lXW81vYov6ye6qPCcDO4lgGGN/MujzkjO0jVDQZ
         D3rfEmYEY4G9J9a4lRl74X3nHNbhqGimmqOBhmU7ayHj3Ih+aRFSDtHy6HGe4PdByjt+
         gtzUO87azLmjD01H1N3mRxrBcckEgECzhdqUaeDV6kUbX7zdphvb3IwZdbk8hsSZTrYv
         fyjMRYZQ1CT86UF7YD8OWOcmWmIOPVJqVGbYicWyo0bfauXsCUJoRBjbDqzlZyqU7iIC
         ru0g==
X-Forwarded-Encrypted: i=2; AJvYcCWEkc4TMGWWfbyVoBzmtxw+4Uwls8BnqdZrk1WjF8m93J8xWvl1oXJ3En5iJ+JPCGa5CWov2/CQTFQZNfg+9Wt7lbGdukmrGs+FJGY=
X-Gm-Message-State: AOJu0YxUJxOwV9Pwp6a1VUD/Va9L7z8Dz88FgBjYZNQxmvSAf9D5OQeA
	6mbdOTWmZKXqr9GKFNaG2JgGLFW8UVNxxpD6iIsbnt+9DD/XFLSeFsSycEG7eXQ=
X-Google-Smtp-Source: AGHT+IFVKPfF66NuPjAADKJBrkWvgX5ieO92Gb9J41ZCUnFhOgQekZi2eAgwtzSOUlsKWxqLqCLEkw==
X-Received: by 2002:a05:6870:ec94:b0:220:a138:f59f with SMTP id eo20-20020a056870ec9400b00220a138f59fmr3341465oab.31.1714485691031;
        Tue, 30 Apr 2024 07:01:31 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:aa71:0:b0:de6:c21:3462 with SMTP id 3f1490d57ef6-de60c21356cls1071614276.0.-pod-prod-03-us;
 Tue, 30 Apr 2024 07:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0s6hmYSu+AYkeb2Fmnu2FFMvWYsFTuUVrF3IA9CnOHsqxbywFxZ8B8MYK/oD7zTjMv8zvWsgqklxDJ/cEvEzPZYkt+MWwRkeOiL3lVM8=
X-Received: by 2002:a05:690c:6f92:b0:615:3262:ffb1 with SMTP id je18-20020a05690c6f9200b006153262ffb1mr3240102ywb.12.1714485690094;
        Tue, 30 Apr 2024 07:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485690; cv=none;
        d=google.com; s=arc-20160816;
        b=oJqJeIdDjRB54CHO1W16HRdWAG8UYGsgYNkgzlZSTLUj/tHEnsRcFyY8PvP/COzJwt
         Zhp2Ufx5ici4nVKh0M185ClYOrV87Cn+d1NWzaSYFIw0NGKTjY6QTh6jWgD1y014/0dw
         ejSZt/tuUKEN6tzQeZyjxVlQZgVm5kI9o2VYSLzjM1sC2tZl341/zzYCfeIQk4hsQExe
         y/1p0cO3Ohb88VqRMtMjBteRbToHEAJhf7HidMjJh3noRxBfGBaftc1JSl+E08LhIgDe
         C+HL1D6ExqKt0MhiCP0IA+mUKG2vFJTVNuqWu15Y+gBe6VAVk6QJNC0J9D8Gcnq0B3B0
         K7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=uYKvItVfQ5vMLpVWGuG4Wu9Mz+mrcrwjH5IKasVHZvQ=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=U8MtsiXAXnb68zqtn21UrQ+Z2L4Bub8M/KD+KFY0KevNnkRvNmhNp9QwJiWRSxkAGy
         tQnJFIsFLCFk0mDPd4k5Si8iBHrDLJ+YqKLI35PStvDeuSmkzFGEToFHaRH4oit3TnUW
         b02UjRfKrMq0SgLhflTsictiVSFgQNVPBQAuf88i/huCJsWdaTOoQZPFfpnxUaKJIQHm
         CCwj9IaCcbbBYK8iXCgPLFgZiWPcpUYa0gYq6kug1mX8lFpCuoaeTi8AOg61lyKjeclA
         fn+ZKAU1qQoQyEgXhER/i8auQBOGqC7UFrqMtKJWSoSnKArcxMIsaZcnvX6Ujd7A8DQA
         bt0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d64-20020a814f43000000b0061be60be59csi861427ywb.561.2024.04.30.07.01.29
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-SKpqMs47PEC-iGbceWdGlQ-1; Tue, 30 Apr 2024 10:01:26 -0400
X-MC-Unique: SKpqMs47PEC-iGbceWdGlQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B84D834FBD
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 380A220169C4; Tue, 30 Apr 2024 14:01:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2175A202450F;
	Tue, 30 Apr 2024 14:01:20 +0000 (UTC)
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
Subject: [PATCH v2 05/22] netfs: Make netfs_io_request::subreq_counter an atomic_t
Date: Tue, 30 Apr 2024 15:00:36 +0100
Message-ID: <20240430140056.261997-6-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Make the netfs_io_request::subreq_counter, used to generate values for
netfs_io_subrequest::debug_index, into an atomic_t so that it can be called
from the retry thread at the same time as the app thread issuing writes.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/output.c     | 2 +-
 include/linux/netfs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 625eb68f3e5a..fbdbb4f78234 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -37,7 +37,7 @@ struct netfs_io_subrequest *netfs_create_write_request(struct netfs_io_request *
 		subreq->source	= dest;
 		subreq->start	= start;
 		subreq->len	= len;
-		subreq->debug_index = wreq->subreq_counter++;
+		subreq->debug_index = atomic_inc_return(&wreq->subreq_counter);
 
 		switch (subreq->source) {
 		case NETFS_UPLOAD_TO_SERVER:
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index f36a6d8163d1..ddafc6ebff42 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -202,7 +202,7 @@ struct netfs_io_request {
 	unsigned int		debug_id;
 	unsigned int		rsize;		/* Maximum read size (0 for none) */
 	unsigned int		wsize;		/* Maximum write size (0 for none) */
-	unsigned int		subreq_counter;	/* Next subreq->debug_index */
+	atomic_t		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

