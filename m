Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSPP6GWAMGQE3VF3AEA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id A37CC827A9F
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Jan 2024 23:31:38 +0100 (CET)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbea05a6de5sf2242532276.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 08 Jan 2024 14:31:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704753097; cv=pass;
        d=google.com; s=arc-20160816;
        b=zoR0cxwj2OxFcZcnQinf9bSxN+9S6fiSJ7CpoFf8F9gzGIYbIr+MrPH3cWEbnBeaMN
         GpP0LZTsMoKBkK2tZuhyAf6o/aRd/xLG6RFsoJNdHPX9Mcug1btd6d+HcJKvOKOLobEO
         PXifHi+KMoUHGADnHddAg8GLudS0q4umDh1+KR5oaEG9N70/LIHdUNbQSgZKUWvLQD/+
         9/adWLAESAE/xR+toDLT95y2mmhaRHq3bxCxTaXQHO9CrlcXx2FFl1vTL9BvSl5Bg7Cg
         JSztCIOps672mCpXGd/X23mSyLKB34q78jxmPMR7ey2JgWzr2bGWEI7ZJ76ILchUanet
         0rOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=QoolWUoZpL4NES7JFc8P/r9UBStY/azH14cmOHimtl8=;
        fh=g+tu93aWyEJs/dPoXvboZFUCEa9PTk36ICdrQIKkLWI=;
        b=uyvgMIrZLdT5JU9kNOXsKdTmJcc7BvqQ/DT3roertmEKoZIVGb91NPRKLyvyA9qWDE
         KbvUadX+eydkSGUdbSGBhHVPFITzkccv4aMfjFT4VnI4moETgRI3RsV30iHBI8yLl75r
         NPkFioYrdIIBdC5mswHggkH4SddQg3e653LRVpMrqR8qOSvDWRDGNnLBXdQWU75tK6kD
         NgcLb2bjFELOTLsI306qU4iSbll2w7sW6m/irnh9FCsda0GTSJhDB7tiNX76wtc2IhbA
         zkz4Xb8QxaMMcuh4D7umZ4IC5k60E11o40tyto6HS7kTgc3o4fnyU2q9v7X9g1RdwTZg
         0AgQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704753097; x=1705357897;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoolWUoZpL4NES7JFc8P/r9UBStY/azH14cmOHimtl8=;
        b=lVFq0HjBiBSSLiHkZ3IKf+8kmw0IgDR7M9GuXkvuTgDQsb7NrmbrrxcRGmgY6PHMOb
         SfiPlk7CrGcSjBHYH7RBMbSOcyjUXgUznAJrRKupcyBmskyxH+ZriSS3Q/OSBPpA1Ple
         Z5m6nw+EQ66xv4kQNZdklUqYNhOJLzvf5XRArgnsoCMqQbpic/olGvlUMB3zcXUNtu5N
         dNchDACRlM0VdPbm/fzLCvERs3ND7tffimBPkfyoInMnqId5slZVPe68YOxtm2WeQGw4
         ZmKR0gkrXXILIc5HFr23o1ICd2DXrYYA9YHL55lNY4dG9mZ9V7iV50Rfz8HaqFAT6pJ8
         l3nA==
X-Gm-Message-State: AOJu0YxzyOFe2pSNLVR1BbG36n4qvIXvl69C+on4kOV3RrQcGW5uWl1h
	vhIHI743s/wQaFFxflm5POlBY5CJGVb4wA==
X-Google-Smtp-Source: AGHT+IEo+oIoNq0/k4sc0fGc36SwGPeMwXm9fIfayYbB+L6LT7rn/Oq+UOpCriS1bzOUChBzV3LO3A==
X-Received: by 2002:a25:dc47:0:b0:dbd:a9b6:b01e with SMTP id y68-20020a25dc47000000b00dbda9b6b01emr2137229ybe.36.1704753097476;
        Mon, 08 Jan 2024 14:31:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:68cb:0:b0:dbf:c90:a543 with SMTP id d194-20020a2568cb000000b00dbf0c90a543ls201081ybc.2.-pod-prod-01-us;
 Mon, 08 Jan 2024 14:31:37 -0800 (PST)
X-Received: by 2002:a0d:ef84:0:b0:5ee:b1f:4379 with SMTP id y126-20020a0def84000000b005ee0b1f4379mr3008041ywe.73.1704753096808;
        Mon, 08 Jan 2024 14:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704753096; cv=none;
        d=google.com; s=arc-20160816;
        b=WDrIS+uM/QOFb8sUjdWyPKG9Vkk6zst5jZR1alIB/tc0I7mXfrbsowctJCN7xbvUIQ
         KFQ0tQtt5+x4Lh4X5G6XeHpYQauZcJ18zllOjI//CngprlY+8UPOcfs8j9+kzNeKvM2f
         FTjSOHPB6W/hLk5/hoy2f/fGPjbc58lug/4GBHRSxN1ZkP0CgyZlqo8rQf9fvhxgim0D
         Pt4n748hK4rMlT/z6UhvdUIq2SnKVoLETbfCONH8H8S5zg0j5tjus/I/7GpvUu1SKULB
         COYR16WDKbuUzrvhqFs30shuoEEo3Kd7PJL5fvOkvJfulANyoeLT8Cb21o98mI5NDOra
         SlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=u1bM8Fm3rKgR1MdtO5gCCH5wWSlCYEy3QYQ83RDetj0=;
        fh=g+tu93aWyEJs/dPoXvboZFUCEa9PTk36ICdrQIKkLWI=;
        b=niJNrH1bZ92Y5TRsM8e4BRLNgzAI1EDtNUZApf0u6Z37r/D2SsRxlDQcQvMVnSGkin
         EV27JNXSsVboJYt8fqfxVMff0Qy49wRObMc7NgrLIUTs2b+Aiu33e3QEaOalwblLyBMR
         SGfUxAE+S7Qn5Ql2uxJta1Q6GbgTfJd0tLqEP9D25PW1HPnJgROpFMguIJSNoBZFlVzt
         PIPoAIVhSCiycIvZbbrpOtwF2Q+NmKj0ivi4MoWetj0Sd9hwhQdcyF1e49hDxyn5xMC6
         ajR3d7lUuuVjzA7zgKSdmRWh+SPuBGpiTwmeHFpfJw5nhQWlE0nE0E/lsFmgd3UVbcPc
         bHQw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i17-20020a816d11000000b005f1243198e3si364615ywc.234.2024.01.08.14.31.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 14:31:36 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-f-VAA-BJOmm56RD5Aqi5Rw-1; Mon, 08 Jan 2024 17:31:34 -0500
X-MC-Unique: f-VAA-BJOmm56RD5Aqi5Rw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52B07185A780
	for <linux-cachefs@gapps.redhat.com>; Mon,  8 Jan 2024 22:31:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4FD45112131D; Mon,  8 Jan 2024 22:31:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BECCF1121306;
	Mon,  8 Jan 2024 22:31:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240107160916.GA129355@kernel.org>
References: <20240107160916.GA129355@kernel.org> <20240103145935.384404-1-dhowells@redhat.com> <20240103145935.384404-2-dhowells@redhat.com>
To: Simon Horman <horms@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-erofs@lists.ozlabs.org,
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
    Yiqun Leng <yqleng@linux.alibaba.com>,
    Jia Zhu <zhujia.zj@bytedance.com>
Subject: Re: [PATCH 1/5] cachefiles: Fix __cachefiles_prepare_write()
MIME-Version: 1.0
Date: Mon, 08 Jan 2024 22:31:30 +0000
Message-ID: <1544730.1704753090@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1544729.1704753090.1@warthog.procyon.org.uk>
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

Simon Horman <horms@kernel.org> wrote:

> I realise these patches have been accepted, but I have a minor nit:
> pos is now unsigned, and so cannot be less than zero.

Good point.  How about the attached patch.  Whilst I would prefer to use
unsigned long long to avoid the casts, it might 

David
---
cachefiles: Fix signed/unsigned mixup

In __cachefiles_prepare_write(), the start and pos variables were made
unsigned 64-bit so that the casts in the checking could be got rid of -
which should be fine since absolute file offsets can't be negative, except
that an error code may be obtained from vfs_llseek(), which *would* be
negative.  This breaks the error check.

Fix this for now by reverting pos and start to be signed and putting back
the casts.  Unfortunately, the error value checks cannot be replaced with
IS_ERR_VALUE() as long might be 32-bits.

Fixes: 7097c96411d2 ("cachefiles: Fix __cachefiles_prepare_write()")
Reported-by: Simon Horman <horms@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401071152.DbKqMQMu-lkp@intel.com/
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Gao Xiang <hsiangkao@linux.alibaba.com>
cc: Yiqun Leng <yqleng@linux.alibaba.com>
cc: Jia Zhu <zhujia.zj@bytedance.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/io.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 3eec26967437..9a2cb2868e90 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -522,7 +522,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	unsigned long long start = *_start, pos;
+	loff_t start = *_start, pos;
 	size_t len = *_len;
 	int ret;
 
@@ -556,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if (pos >= start + *_len)
+	if ((u64)pos >= (u64)start + *_len)
 		goto check_space; /* Unallocated region */
 
 	/* We have a block that's at least partially filled - if we're low on
@@ -575,7 +575,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if (pos >= start + *_len)
+	if ((u64)pos >= (u64)start + *_len)
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

