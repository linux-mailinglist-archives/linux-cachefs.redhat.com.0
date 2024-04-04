Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4N4XGYAMGQEO64RXNQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E338982B2
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Apr 2024 10:01:54 +0200 (CEST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6993768b784sf910346d6.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 04 Apr 2024 01:01:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712217714; cv=pass;
        d=google.com; s=arc-20160816;
        b=sCbY2r2QnYGmf8lRhm5PBm10gDlQ+uozZ+FDbcddSnE8qUNf7zaWuli9LUpRVv45oD
         pxscYd8C256miBeqIiZSBAdh30ojwXLKAO+RObN9JR1ETp/Rg+oNqsB9qJmgTzQIiFx6
         7NLYVp2vF4DYfJP08R74nZTeecixXo400fpebgeXLU9RtS9/CIMLQ1+oSbvZ0aQ0OIk8
         X/LYIP2yDG7ZZBNJJ7R5S4NsA1T9agjcjD0uhLs1k1Vc8FTok+AdcP3A9x1jZ2Btbt9N
         Yxk/ymNcxDA2i60LVDjJ71OZsHLHg3Gyl7K1J3eSLLzy+ziIBLaOx0G7XJfQBLEB4sd0
         AsDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=ytiBZ3pKpxk1c4sSgCCDeqpkYh3DpoDrg0YHEHuzRys=;
        fh=npYz7NVAxvwsEjPZmY9tVz0/mqlAxvYw4HUYcu9MR3w=;
        b=QXOQhZQztL5c0RZ7CQ7IMM+dgB9OpGh2bD2HianqM65fMfw+nq85jmynJnlYc+0rG8
         Fl5qn+Viir5ZY8xdVTIYF9/fyWJPPfzPcBQ3rLCxQUTBx/pkxZYJpYr3K08pf0DKm/MF
         tJ25yuiogGRTdHDZtmVFANdGjLofjBRGbNEcdOT80m+37CqzXFfPrsYRCvp+ZOXEOKkB
         2n7aR+Ih70WA9rl1aFhiN0wkCE8AmDmmhiasEswigxOY+CX1tCrd4lCxFdF1l/XFweDi
         WWGjhbJZHQerrFhoYAbOQimha8rzm2fwUCutbiZOBIm//DwiRlepQsgAHWBKCstlGpT5
         1YKw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217714; x=1712822514;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ytiBZ3pKpxk1c4sSgCCDeqpkYh3DpoDrg0YHEHuzRys=;
        b=FeLPTIbStADwy6ZqDvEFd2OqXMc+7YK11SB75LJyLY1LVxZJBte6amMGQmKHcY+BLB
         +3+vyAeTxywwmhIK/svErX6pGQnwnXDC3FIj3QTbcGBBGWEAQzAndR3TuO+7xZIj5eOe
         eRtcoXgYjRt+8GvKImYBUl0dswOXosgnqAytKzNqSjddkNTMiJMMw3CN5+D+m4QL1kBi
         /6jWjV6g/ZY0oTV3RRuFonR6U6/ArVDWloRUBDzmTPPJPeTMPYfhKpVtYgvKfXy9RE++
         HXQrzMkFxkJrqOWOzo1yWuRF9K9LY+7K5tIsqnVKCHJOqDLrvR6YUShcj/Sz0Md1yzVo
         CHpQ==
X-Forwarded-Encrypted: i=2; AJvYcCXHEHwXxoSZKApZjQIRrrYoCXCKsZo4x/9HUpAxeD4iFzGlDtZKdq6CXLX4117o1AJtfPvVYIOcO7q4G4g8SEh6BsHkqEAb66ZgD1A=
X-Gm-Message-State: AOJu0YxBgqh+EMeU+Dr0Af/f+DvxUVinXNWM0oBXmxVaPiIJXIJ7dAYJ
	8jwOzcjLRRoVk9ag7SH4qwcBXwuxHo+0/pYYycNhAYU4Sa+wEmWRScc/KlwjZtY=
X-Google-Smtp-Source: AGHT+IGqizydtCivYaqo8P/magUOpMllzGIN8q8+fVn6bkNCY32c54PxUyK6UwlBpD73ybs0yUgS+w==
X-Received: by 2002:a05:6214:2528:b0:699:267a:7894 with SMTP id gg8-20020a056214252800b00699267a7894mr1520237qvb.51.1712217713911;
        Thu, 04 Apr 2024 01:01:53 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:62a:b0:699:2bab:a332 with SMTP id
 a10-20020a056214062a00b006992baba332ls1052084qvx.2.-pod-prod-04-us; Thu, 04
 Apr 2024 01:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmAgGGmeFoRiE0F3lGY2XYYYttLFzK4sfRpZKHRXLPDe4hRSa1OoDTdTVgc9TGhfthPVjmT2h2+nUbgvMYdPXg/G+0+Lu+t54Og+uGpM0=
X-Received: by 2002:a1f:fccb:0:b0:4d4:3fa5:e19e with SMTP id a194-20020a1ffccb000000b004d43fa5e19emr1425555vki.2.1712217713173;
        Thu, 04 Apr 2024 01:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712217713; cv=none;
        d=google.com; s=arc-20160816;
        b=yi3QzCD5HExXp/mPW0rqWHU80kxAXncvtTKAhS1UNkb5aOUPIiIauzPuckShTlrNh2
         BKlHJ2ysy1uoazKk44N1Rx1+OCA4EmbsOUGIKtctm/68LxXvTyebAmtXVkGjZ+q8GdBU
         Sv8w3luQa8jh2BWRZBh4EagoK1WeuBkmzxtF2Rzif3IDMN/UB3QsjI9MT0nrtq99LTVh
         Yb8TGqJB4P+vBI0gaFQIAkRHcr5YbEEtg8fzPABdObvAcw0sA0g9CzIH+NoLF60ZhlF4
         XKDDNhg/sPI1zAfkVo7bm04mDL7KoxivPdUSrVKrbQ7I0sm8BKwWh472TgUTu3hVqHF/
         Ar8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=NB8mnIPeIMJTUwbGSYoQ/Go3FbHf2JNTUCs3BWmBA90=;
        fh=0CIerLb/cM50vy7gQm3XRz1x4J6a65cahl3DlMj5j9E=;
        b=Frypa4xj4K6+md/ZyzAJ42YkT9DnST67E7BpxakcD2EIpAVu1udPXYq2SC9Q4KAOt2
         VKwjmOPaTlseAbIg++EqHYfHcQQIgYtTjsrDqUquC8iGNaOduPLxqbH0W8gh8YNHVNZ1
         P1KszZj9wbflmCoSnVYs9ub1htKaYinq8PtiDSXw9bNgzXvVDMPvu4zUgtvsUer/+baj
         9R44Kf+4KK/KBcQt/VH1SFthb4Wkd1yRFj90G3KjvgY+bHCgDLC9f3KHwacesjkNFtHr
         WEl2mEjFVRj6l4Gd845O5QUOA8jOKurimZKy6nXTEXBGz/sgUPKi+52u9QFvTDhsBl5X
         wvrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id z7-20020a0cfec7000000b006992f1b2fbesi1715554qvs.375.2024.04.04.01.01.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:01:53 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-pVOhSrzWOUKAHP3F5YZ1LA-1; Thu, 04 Apr 2024 04:01:51 -0400
X-MC-Unique: pVOhSrzWOUKAHP3F5YZ1LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52031805AA7
	for <linux-cachefs@gapps.redhat.com>; Thu,  4 Apr 2024 08:01:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4EC07C15771; Thu,  4 Apr 2024 08:01:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD1EAC1576F;
	Thu,  4 Apr 2024 08:01:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3655511.1712217111@warthog.procyon.org.uk>
References: <3655511.1712217111@warthog.procyon.org.uk> <20240328163424.2781320-22-dhowells@redhat.com> <20240328163424.2781320-1-dhowells@redhat.com>
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
Subject: Re: [PATCH 21/26] netfs, 9p: Implement helpers for new write code
MIME-Version: 1.0
Date: Thu, 04 Apr 2024 09:01:43 +0100
Message-ID: <3666291.1712217703@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3666290.1712217703.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> > +	size_t len = subreq->len - subreq->transferred;
> 
> This actually needs to be 'int len' because of the varargs packet formatter.

I think the attached change is what's required.

David
---
diff --git a/net/9p/client.c b/net/9p/client.c
index 844aca4fe4d8..04af2a7bf54b 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -1670,10 +1670,10 @@ p9_client_write_subreq(struct netfs_io_subrequest *subreq)
 	struct p9_client *clnt = fid->clnt;
 	struct p9_req_t *req;
 	unsigned long long start = subreq->start + subreq->transferred;
-	size_t len = subreq->len - subreq->transferred;
-	int written, err;
+	int written, len = subreq->len - subreq->transferred;
+	int err;
 
-	p9_debug(P9_DEBUG_9P, ">>> TWRITE fid %d offset %llu len %zd\n",
+	p9_debug(P9_DEBUG_9P, ">>> TWRITE fid %d offset %llu len %d\n",
 		 fid->fid, start, len);
 
 	/* Don't bother zerocopy for small IO (< 1024) */
@@ -1699,11 +1699,11 @@ p9_client_write_subreq(struct netfs_io_subrequest *subreq)
 	}
 
 	if (written > len) {
-		pr_err("bogus RWRITE count (%d > %lu)\n", written, len);
+		pr_err("bogus RWRITE count (%d > %u)\n", written, len);
 		written = len;
 	}
 
-	p9_debug(P9_DEBUG_9P, "<<< RWRITE count %zd\n", len);
+	p9_debug(P9_DEBUG_9P, "<<< RWRITE count %d\n", len);
 
 	p9_req_put(clnt, req);
 	netfs_write_subrequest_terminated(subreq, written, false);

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

