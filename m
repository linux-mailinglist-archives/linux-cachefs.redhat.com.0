Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPMH2GWAMGQE3NO6X7A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477A822023
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Jan 2024 18:11:26 +0100 (CET)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bb7872450bsf12555853b6e.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Jan 2024 09:11:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704215485; cv=pass;
        d=google.com; s=arc-20160816;
        b=MIIdvvIClmyZErU1gzFOV+znwxSd0WeVuQnc310yVWXN1KzoViDTqjjW/9nXKinDyz
         vPLmntXe/NEpvFP47rD83yUbsMI1osmR1wTpDqQ9Zu6NQMJ1O8gXo9lLxSmoQDPOPeqm
         7ZkrjiNREjomJhACNBlKAjhcK6Qw4zV4pX1pFwhW13ERyNd9NZBmEtds3EnDoY/uJ955
         1iZLYNJDpFc+qkF+rcOS0Slq6dOfTuEkeQ5Jk1BnMLR7P/F5PV2HXRhk4BZQpZxhL6Em
         Tf7NybmTK3tmuWc7SCtZ4ja1Q4r20CfurbI6LNJmCjXqjuaxlu4XiOhxFFBHPAVxe4Ju
         k0vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=Yjk0d+ASXJUZIYbjkke/cMPR35v2mWmQjiSWs9b2xDA=;
        fh=gp6U81+B+5ExOLgIbzeqIO8GdP6UE+1OeZs/a87ahnQ=;
        b=NrB2XGmXBjjFO1LaEW1tmg+YfU4WoyGPPrxXXj+5qeF0g+5dIKDLOX6QZ+KrFutZNc
         jlusvypVuz7G5L+0udLXAQ5vFRrjuBNaZCNMXT0KP6DIJUP3JmTZ2yZOssJPyYuBBAMa
         yriUkpEbC6o1MyfrfWrSNjP5RJYsZUvI/URURgX9c4p++TdDubvZ7BEyn+OlSiPwB0sU
         HHOns/E+0fHbjVuPLOLe6kzZ6sin2CJdrwgR9x5/r9UWprtCvmJvluB/rsibz/mBfKYQ
         HzZoneU434RHambdIbAGDhuaSNkLOR/hvQC/n/TPSW4PxfWZJi8oU/NUCsvQ7jv+4iMT
         NIJA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704215485; x=1704820285;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yjk0d+ASXJUZIYbjkke/cMPR35v2mWmQjiSWs9b2xDA=;
        b=nPhox3BCE6IWkSMWJJB1AnHrNxHTFmlfEeIC93uBoB9QXlU4tkzZ5CGoj4mmSLCOA+
         Kx2devmQclXv5Vk0pfkcYivO9ZUxF01ukb2pGy/M999wIaEbPF2eQNJ/qDPbVCg1Lmc1
         QUZWETvdYg0cdKx99Idscs6z6npCWSHvOD6UUa5qwLBmcZT/lns7RjusOjK9YIlkZNR7
         LAHunIHpRsjqixAWrOArRsT6EUjC8z30ITzmEa+IWTh3KqyU/ZH3iIAHEaHaiKgQDJWw
         nQv2rTfEA5cvqb1mIrYpH8YqQMgIcd3F6LLML6KZHHM1dVfcWesX0AKRzFHK6nK5coX+
         yPEA==
X-Gm-Message-State: AOJu0YycB0KMJhN1vC70eL8KKx/E6QIX383pxFF+F6dzIf+Vd4nRokXF
	dYRFHeWCZLB3P9tC00ZfXRGgJi+nEnLUfQ==
X-Google-Smtp-Source: AGHT+IH7Mc3VNgdnqWPWtLDrRzbpCjhUKQKUP6uy6q9qe0x46BE3DLwPxzYJ1N5klhkGIZ1bKopm0A==
X-Received: by 2002:a05:6808:3024:b0:3bc:7b0:c39b with SMTP id ay36-20020a056808302400b003bc07b0c39bmr3530953oib.26.1704215485284;
        Tue, 02 Jan 2024 09:11:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1bc9:b0:67a:b34a:6626 with SMTP id
 m9-20020a0562141bc900b0067ab34a6626ls3175331qvc.0.-pod-prod-05-us; Tue, 02
 Jan 2024 09:11:24 -0800 (PST)
X-Received: by 2002:a05:6122:178e:b0:4b7:3141:ff8a with SMTP id o14-20020a056122178e00b004b73141ff8amr3339140vkf.32.1704215484647;
        Tue, 02 Jan 2024 09:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704215484; cv=none;
        d=google.com; s=arc-20160816;
        b=yPxe4wUiCXJMn11CtiFw8FqRmO96XdrI5pk5vnHLHLjH/rr7MKBwPIGkgnfkXjhG4U
         WoquzBukGtRLfr8o0t39CibOqaU3twqARZO4Jv5by/ksVLBg1vVzLAZIiGg6CXZirAHY
         zU0fBaDN2ZWdkLJuvVRI/V9rSqdHtBdACbemZ2pBMwGT33+e5EoJuMjOvWJxyx5OQ3cO
         HnzAjGiNKEtd59Hu88rOUvQ7R9+igtkYWxwFvOdMt+XwU6C6wqlex/CvQ7LEie7q/djl
         fHlK/3W1hOycYp9TXeIpkjD0BtGU6m1RVYruGD0szxIbz6tXk1N7+a99XBSI+ZmQ4su8
         o28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=M5cPsW4t8h3fwmIL4S1ck+O3/vir9ck/2TWp+0RZVdA=;
        fh=gp6U81+B+5ExOLgIbzeqIO8GdP6UE+1OeZs/a87ahnQ=;
        b=nKq2BS7EgY7Xz2x0ZoLEfpZe7azWvmbJcqZb2q7/sMqJwsH2sSj2fIRiejnUPwBhZZ
         Evr/K6jp/NbVjQIsjTYdyj8ubXWAQ8RQqtcNCdXvXlyE3dV8UATb7xGANZ/1xmnbkl7Q
         vne3Xtj08PKd3I3Opd69YXes4xTH1eidLAVyZ6oZUGdMdlqvU0uIU2i/5OX7tETKnAPf
         QR238YFimOuL1ofQqhsiLhBba+v3VVZHi+XHvy09Bb8xR4+jIiF0+/qqjJX64BKQzoJI
         wcL9WKLX/AhqA4T5TWzU0yrf8IkAl4IEkECXC6IQPvB/W+m17EKxhUvr0Gk3GEtxNtdG
         1g+A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i4-20020a1f6d04000000b004b4d9824d11si3044260vkc.280.2024.01.02.09.11.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 09:11:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-lHwHrpPvMdyEPxmR2jEGdQ-1; Tue,
 02 Jan 2024 12:11:20 -0500
X-MC-Unique: lHwHrpPvMdyEPxmR2jEGdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A66083C0009F
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Jan 2024 17:11:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A319A40C6EB9; Tue,  2 Jan 2024 17:11:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6A1940C6EBA;
	Tue,  2 Jan 2024 17:11:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <750e8251-ba30-4f53-a17b-73c79e3739ce@linux.alibaba.com>
References: <750e8251-ba30-4f53-a17b-73c79e3739ce@linux.alibaba.com> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-34-dhowells@redhat.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: dhowells@redhat.com, Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>
Subject: Re: [PATCH v5 33/40] netfs, cachefiles: Pass upper bound length to allow expansion
MIME-Version: 1.0
Date: Tue, 02 Jan 2024 17:11:17 +0000
Message-ID: <198744.1704215477@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <198743.1704215477.1@warthog.procyon.org.uk>
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

Gao Xiang <hsiangkao@linux.alibaba.com> wrote:

> >   	down = start - round_down(start, PAGE_SIZE);
> >   	*_start = start - down;
> >   	*_len = round_up(down + len, PAGE_SIZE);
> > +	if (down < start || *_len > upper_len)
> > +		return -ENOBUFS;
> 
> Sorry for bothering. We just found some strange when testing
> today-next EROFS over fscache.
> 
> I'm not sure the meaning of
>     if (down < start
> 
> For example, if start is page-aligned, down == 0.
> 
> so as long as start > 0 and page-aligned, it will return
> -ENOBUFS.  Does it an intended behavior?

Yeah, I think that's wrong.

Does the attached help?

David
---

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index bffffedce4a9..7529b40bc95a 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -522,16 +522,22 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	loff_t start = *_start, pos;
-	size_t len = *_len, down;
+	unsigned long long start = *_start, pos;
+	size_t len = *_len;
 	int ret;
 
 	/* Round to DIO size */
-	down = start - round_down(start, PAGE_SIZE);
-	*_start = start - down;
-	*_len = round_up(down + len, PAGE_SIZE);
-	if (down < start || *_len > upper_len)
+	start = round_down(*_start, PAGE_SIZE);
+	if (start != *_start) {
+		kleave(" = -ENOBUFS [down]");
+		return -ENOBUFS;
+	}
+	if (*_len > upper_len) {
+		kleave(" = -ENOBUFS [up]");
 		return -ENOBUFS;
+	}
+
+	*_len = round_up(len, PAGE_SIZE);
 
 	/* We need to work out whether there's sufficient disk space to perform
 	 * the write - but we can skip that check if we have space already
@@ -542,7 +548,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_DATA);
+		pos = vfs_llseek(file, start, SEEK_DATA);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		if (pos == -ENXIO)
 			goto check_space; /* Unallocated tail */
@@ -550,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if ((u64)pos >= (u64)*_start + *_len)
+	if (pos >= start + *_len)
 		goto check_space; /* Unallocated region */
 
 	/* We have a block that's at least partially filled - if we're low on
@@ -563,13 +569,13 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_HOLE);
+		pos = vfs_llseek(file, start, SEEK_HOLE);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		trace_cachefiles_io_error(object, file_inode(file), pos,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if ((u64)pos >= (u64)*_start + *_len)
+	if (pos >= start + *_len)
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */
@@ -577,7 +583,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	ret = cachefiles_inject_remove_error();
 	if (ret == 0)
 		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
-				    *_start, *_len);
+				    start, *_len);
 	if (ret < 0) {
 		trace_cachefiles_io_error(object, file_inode(file), ret,
 					  cachefiles_trace_fallocate_error);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

