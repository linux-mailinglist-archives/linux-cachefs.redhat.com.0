Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAVCZWXAMGQEWUFSWIY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC385A402
	for <lists+linux-cachefs@lfdr.de>; Mon, 19 Feb 2024 14:00:52 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-598e0a8a456sf5190063eaf.2
        for <lists+linux-cachefs@lfdr.de>; Mon, 19 Feb 2024 05:00:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708347650; cv=pass;
        d=google.com; s=arc-20160816;
        b=YsHUwAvKxQk54momWrqEr1guezWzAXVwE7b5Zd9Aeav5GZmeuWnV+UAA0Xflk2+Ld6
         sTlp/EavXTbxLVz0L4JhiQPh9HsW3DfBSmuGLGqcUChnARC4fbZiW+QLynY6KVn8DJhl
         FJX5dx67J5GjcO7dVWYKVc3F4o5W3X5L6vDKD2vYb+Fnzsj7zxJQdMn9C2LOpI9CKYsm
         x0p1XifikG9ZHPccvoU+XFys86qpTunxlWsxTXYRs+Dzq09RJDjWoROCOmNs6skz8GdK
         Ey2UsDu9p3/U6fSeXHnHOwCqZxuFeuFaHz3DMifGj8o3nhhle3aXuy94bH4SSbzTBJ6K
         h/Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=QMs+d+x1tVRSBHSu86v3DdqouZS3hJxtjKyfpluhYjU=;
        fh=AQmwJj3GZNKPy02AKuI3D++gubA57PHJM2tslive/R4=;
        b=VXLmEUpmLyUCOakVB5zClT0J0hy9cWkpDatFd0/Rz9A/pS++TsuczDwW4ke7tE6CVV
         SL3ILU+3VtXmF8XcZ9X3UkcJr6Zg969W0kVE16hDzmuw+1b+LTlpKxfa9rknr7ThH3Nw
         abYxUSCdetGn0wW9GrvUF6AzCL/4T93Qw0vQOWf02REc6L5S8zdvusIqCTXmFFfXzgMt
         myEfOZCc2JiK3RnN18yVxQOLHhCTXUkUcxyDYuFlk/0Yf8lhEs1zun9F+1up+W/CO+Uh
         3quc4WyZr9SvAmF82c0qLPKWo0A6pgKY6q/xPbzTaC6WknzMG7gVH252E6du4ZkFstma
         I5FA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347650; x=1708952450;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QMs+d+x1tVRSBHSu86v3DdqouZS3hJxtjKyfpluhYjU=;
        b=tcozgBIay+zDIvAj4mcWaYz4DRhvD0gnKIaazWgx9SrF5EZW6yZlzOxNG4cSep1t/E
         adgrouO5n9RrhRy9LSUDwXqHDXaNakaHtHG+On/MmfMN2r0bWLHpNmddMKCR7I3muJOk
         u8Q76Ls3wbeMjhVfqWyOwTo4co5JWLC+XVE/6sG7EtSLpTD+6ri0bqeNWfmxOwwZ+75i
         kVHjOdas9oXWTO52Rylp4pjdIIiNr1KsNpAb1d83eZNN0BGH7EXCcZYUCcEJQ9utETcj
         I68l/9RMG6jJdWgCAH7L26aT/2ovZYJKigk1v6/7rxH9sd/tXsdf/3fMqUDYtcCRiqiQ
         CJiQ==
X-Forwarded-Encrypted: i=2; AJvYcCU5jSNVcXvIOv2KNcX7/rbJ8mE77s3QWc70Qz1Gbt3kUCmgZznau3PDcFiAiwNWGKNhB2DAXZOWb3HCJ3qXpT06op0+Fm8CpepdAcg=
X-Gm-Message-State: AOJu0YzTPndMoGvS642ANFXGhM+cHujVX/qPEAcQtqNzSrRuFKv2+8c0
	CpE3caUTExnLJto1j2DZZ5pG+mSz2TrVI5uEz8QW7u+muAbsRaT2JjGbKhc2cIA=
X-Google-Smtp-Source: AGHT+IF/3VajszwPQcGZ7psLHn1y76rpaJVbStV+o2IARA9wObIS+Qt2xTIzHN/ZA4uY/TShhG1ACw==
X-Received: by 2002:a05:6358:c83:b0:176:b156:f69d with SMTP id o3-20020a0563580c8300b00176b156f69dmr11157461rwj.31.1708347650344;
        Mon, 19 Feb 2024 05:00:50 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:58c9:0:b0:42e:13d3:537b with SMTP id u9-20020ac858c9000000b0042e13d3537bls831140qta.2.-pod-prod-01-us;
 Mon, 19 Feb 2024 05:00:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9l7Qam245+wf75PScN8/CmlcBY7HTBqRsKw5Vf0AtDC4752t7bk6kgB2hoX0PAuIOKo+XP4oPkwpjfR2jm8cKipU3n209djWIq687i+I=
X-Received: by 2002:a05:620a:454f:b0:787:234d:5e9e with SMTP id u15-20020a05620a454f00b00787234d5e9emr16058375qkp.45.1708347649569;
        Mon, 19 Feb 2024 05:00:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708347649; cv=none;
        d=google.com; s=arc-20160816;
        b=mAD5HUqe5o4RiGCVHtmJ99LpIrdHV4+xzVw/+/MMbtpS1cyBD3zWe3enmf4S+eE1L1
         PxgEqaJNO8DlYBx2Nc8IYd6up/0/Wm14A8AbO/tbw+4ybZMpBoAeQJ3GRyNvuvB0uYTJ
         VTGMLpnZoof+Qz6io8/tJYh+qbNkkuknZ8TLwp29iakILzkOmitPIfx4tvXQI/DVuEqu
         oZWBQf2YkwO3/beMszzapvXsu7mavBd7kE+iGqjPvJdO7rE80Lj/yk92vIALhd4Dw8TW
         9gR/lbbYYpjPr6FWAuIhG2MHsfKMfM+ob2NKdOCTJxFa/GvH1MeIiAmrRJrCK9pm/vHU
         aJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=l399f5k17yvE8sQnuMHIF5XYzCwlpGNJXV5BvswDMtY=;
        fh=ReBVB4u9dptVVPamk5mhHV9fnQxXQ2AYbo3iO9CZz/Y=;
        b=BLChqcW28Q7+vJBSn83O0rfTm/+hzZd5lmajzvTBJdx3cD9UDNWj2W/Bioozuxtcss
         wxXUnQyCavvYR/63qKT+pGGGRaClCjk8+8nMd8HB49jPnEZ0KI0jOIAKWNAQ24CjujMa
         5klfLpZvCjSteZZMZIzk0RMAKKE9hRwvQospWhdIjRzkoNQwR3q45MzCG8VaKxOBLeIw
         ZPoqC6e/j7yjXUyjstU/eS122QsNQKBEeageEHq9ITiW89GCZFXmAsovxpJ9JkMff26t
         wNLuqqdYaFQfPD5vQZ5P7zYU+1kmLW878JAvmVxd+mSl8bqWyFN92r+M7pt5CzOmvjWh
         fjgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x3-20020a05620a448300b007873e89924fsi6629841qkp.460.2024.02.19.05.00.49
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 05:00:49 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-AGzZpAQSMNG70II7hE0jiA-1; Mon, 19 Feb 2024 08:00:48 -0500
X-MC-Unique: AGzZpAQSMNG70II7hE0jiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD7685A588
	for <linux-cachefs@gapps.redhat.com>; Mon, 19 Feb 2024 13:00:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C7E568BCC; Mon, 19 Feb 2024 13:00:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14603AC0C;
	Mon, 19 Feb 2024 13:00:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240217081431.796809-1-libaokun1@huawei.com>
References: <20240217081431.796809-1-libaokun1@huawei.com>
To: Christian Brauner <christian@brauner.io>
Cc: dhowells@redhat.com, netfs@lists.linux.dev, jlayton@kernel.org,
    Baokun Li <libaokun1@huawei.com>, linux-cachefs@redhat.com,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] cachefiles: fix memory leak in cachefiles_add_cache()
MIME-Version: 1.0
Date: Mon, 19 Feb 2024 13:00:45 +0000
Message-ID: <131233.1708347645@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <131232.1708347645.1@warthog.procyon.org.uk>
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

Hi Christian,

Could you take this through your VFS tree please?

> The following memory leak was reported after unbinding /dev/cachefiles:
> 
> ==================================================================
> unreferenced object 0xffff9b674176e3c0 (size 192):
>   comm "cachefilesd2", pid 680, jiffies 4294881224
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc ea38a44b):
>     [<ffffffff8eb8a1a5>] kmem_cache_alloc+0x2d5/0x370
>     [<ffffffff8e917f86>] prepare_creds+0x26/0x2e0
>     [<ffffffffc002eeef>] cachefiles_determine_cache_security+0x1f/0x120
>     [<ffffffffc00243ec>] cachefiles_add_cache+0x13c/0x3a0
>     [<ffffffffc0025216>] cachefiles_daemon_write+0x146/0x1c0
>     [<ffffffff8ebc4a3b>] vfs_write+0xcb/0x520
>     [<ffffffff8ebc5069>] ksys_write+0x69/0xf0
>     [<ffffffff8f6d4662>] do_syscall_64+0x72/0x140
>     [<ffffffff8f8000aa>] entry_SYSCALL_64_after_hwframe+0x6e/0x76
> ==================================================================
> 
> Put the reference count of cache_cred in cachefiles_daemon_unbind() to
> fix the problem. And also put cache_cred in cachefiles_add_cache() error
> branch to avoid memory leaks.
> 
> Fixes: 9ae326a69004 ("CacheFiles: A cache that backs onto a mounted filesystem")
> CC: stable@vger.kernel.org
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

and add:

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Acked-by: David Howells <dhowells@redhat.com>

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

