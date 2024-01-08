Return-Path: <linux-cachefs+bncBDLIXLMFVAERB2P556WAMGQETAFFMFA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8D3827064
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Jan 2024 14:55:55 +0100 (CET)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6dbfd044461sf2126092a34.2
        for <lists+linux-cachefs@lfdr.de>; Mon, 08 Jan 2024 05:55:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704722154; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xkws54p+JKWsD7D7SycJGwR5WeZbpnNG4n4JYnEsazIIWKLpywBe6Z4Fp6vvG4x9Hx
         T8MrSoorYX861KW6w4PsWDq5RhnR/g4OdgmWDdhTsdEZaNTGMxWpmGSFK41pGp2VtAe/
         Dd47Ed/LC8qli+UOQbdNoKiDvh4QENmpMRAqIAkgWr+mlbFV4VgVcw1XESfvb1f50BBK
         N/QlIL2Pqoxaf25r77ZkSnOypogTZCnGF1vNn667UO7Ga5rKDsLLJ4g59qsi/EyznWNk
         QRvP7yNkZmnZkINAmUCnSOfCUf9SZnLJG/Z7KW0ngpo9e/oAbTLA1NMeLNPhVa5yadZm
         jnKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:from
         :mime-version:subject:cc:to:references:in-reply-to:organization
         :delivered-to;
        bh=c7Tf7S9DLpDnOnRZWKH5uJzeq2fs8pMayafoOtmQdwc=;
        fh=9A272QN6uIqAeSIw4b2b5ykHO7d1n9nQjPoTq5tdWZg=;
        b=jrjXT3vGMFJjXw/+leU4LhdI42SaHoaRALm3oCtai0b1cr4u8cet8M5AXwIqMmSq0P
         myqcJlogZhUGB4ffMiWz8WRivXnjZrn2ppWSSl75brc7Uw6uHyIZ/kv1GoxDx3CbJ8QA
         bJMbEMabJrAFNOFVhbaSgxjIPniOawfQdiF4gLitWQTW/+CrQQUFpjYDRbmjZI7fmdJk
         EBszMmPIix3hniQtmmSizVYk2hFQ+keVuRAc/mDOZaVaVqkyeXw1s30lLjRn2V9o8/Tf
         7sDFOEqqcTMctp/3dL68xsneCca20izI1/PF8SGtVWO58yI44CRkJlUemXejm7RGayYO
         d4eA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722154; x=1705326954;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:from:mime-version:subject:cc:to:references
         :in-reply-to:organization:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7Tf7S9DLpDnOnRZWKH5uJzeq2fs8pMayafoOtmQdwc=;
        b=OO1ZEpoMTkZOhDcYdQokJcm8a80TX4+s45+8aCfisVg617LCZLiW0mM/rkBN1oC0Jg
         8NrJRW+PDa4PQGOAMWlp7c+f3zLg3OMnBV5QCfUXJM+N86HQ2b1iXpC6ek7AKjJBgi4l
         wvtqtz0M6UrLW7WNqw/ToII7iKZ2NLbLOKS8rOxCMb4l8bYXvetEJL0N0x1on861yXa4
         DcP2nEDftgowsinlpRqFyo3YYGx5+Z8NZVUbWvGIPCu10qfH6c4qDMW1rIL7T3kB3sbS
         u3FKaNcl33m5ElOsCSSIhjNhSDdhF1MBtesBPPOLOKqCsXTlXRxWu3e8kf15Ge390jCk
         1C6g==
X-Gm-Message-State: AOJu0YyJsv0RTl1NEnOgIVCsUffqVJxGiCxfC2hQK9btyuVVjGlIxUm/
	Ctr21iowrzURyh4G5XIGpMD32z2WgF6v7Q==
X-Google-Smtp-Source: AGHT+IEDiSy/asPrT+ronFNLxNABLMKvzWA6Z+/Ru8JkBvLisyYRTwmhVkaAkmss0JVtv7Hz0rJEnA==
X-Received: by 2002:a05:6830:118:b0:6dc:18e3:78d4 with SMTP id i24-20020a056830011800b006dc18e378d4mr2630707otp.59.1704722154230;
        Mon, 08 Jan 2024 05:55:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7481:0:b0:427:e98b:7eaa with SMTP id v1-20020ac87481000000b00427e98b7eaals2117894qtq.2.-pod-prod-07-us;
 Mon, 08 Jan 2024 05:55:53 -0800 (PST)
X-Received: by 2002:ac8:7d4a:0:b0:429:9e61:f9ab with SMTP id h10-20020ac87d4a000000b004299e61f9abmr218690qtb.115.1704722153494;
        Mon, 08 Jan 2024 05:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704722153; cv=none;
        d=google.com; s=arc-20160816;
        b=VzeciO2ln5tzGb1Wu1PxO7CMZ8rcSAmL0XuSLw1AgttoOygxSrcEFOJdZA4HjZBFsN
         GiG/K1YG2jcaH5gkL7rvd6ACnF3Ag5gOp0EmhA5wqnLMDdYLUMh70DjjCt9HgJHXpjaC
         4KboNl2xyLtO2RvMIqtKvpdu1JvwJJYw8bqui8/S7FI7GteNqwjx7EWtFBg/FIgrZpSO
         ZYQ39PAE13rFIisCUOAlxXZS1SJ7LVq2+PCdMDk/IhNs1ZnqIYDGpluSno0GGI3oh96q
         zEtc6qRXBa3m3y5D/BaPzsPMu066Wf3hn351HhHAj/d4IwXDciyQS04uJJQoQQMfE2if
         9nuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:from:mime-version:subject:cc:to
         :references:in-reply-to:organization:delivered-to;
        bh=xIbiAoj2Z3CYeI3SIW7dD3XbJpcWqFJ6BlUheRPsgEg=;
        fh=9A272QN6uIqAeSIw4b2b5ykHO7d1n9nQjPoTq5tdWZg=;
        b=cxbEm5ZnO/DE7vqvzHe+QwTj4+D6ePtsLm2gpr4xbM228HP4ILdAL2GfyXzN5UIh5q
         C2m/CbXrzFlSTXB//XIt3u0TmCN7Kq8vPHWUFYov7JxN6h2Xwi6+zJIk73H+LiSd8HC5
         G7Kmb53GK18EjE7tN62T04k3Pdk3SVf+TDb0ne4arK/HmaFfti4QHBkynKAwumgo5Rul
         t4svuPu2lPabAB6W5zaNT/+RtIiuhVAEGuKdKm7YL8HowZQ2hHfQ+5zLMfc0IJ8dn8N+
         UbHAfwiQVjVj3C6hUze4PmZa4vx28bIdfsnDDzM1klfWUcQrBMU0JB4Jr/qGjU9egZcP
         xmCg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g8-20020ac87f48000000b004298dc51cb2si3443539qtk.772.2024.01.08.05.55.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:55:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94--jRvEWO4OEqoUvbZaB2TRg-1; Mon, 08 Jan 2024 08:55:52 -0500
X-MC-Unique: -jRvEWO4OEqoUvbZaB2TRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9D0C85A58F
	for <linux-cachefs@gapps.redhat.com>; Mon,  8 Jan 2024 13:55:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E6C81C159B0; Mon,  8 Jan 2024 13:55:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 001B8C15E6A;
	Mon,  8 Jan 2024 13:55:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240108112713.20533-1-duminjie@vivo.com>
References: <20240108112713.20533-1-duminjie@vivo.com>
To: Minjie Du <duminjie@vivo.com>
Cc: dhowells@redhat.com, linux-cachefs@redhat.com,
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] netfs: use kfree_sensitive() instend of kfree() in fscache_free_cookie()
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Mon, 08 Jan 2024 13:55:50 +0000
Message-ID: <1522748.1704722150@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1521939.1704720813.1@warthog.procyon.org.uk>
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

Minjie Du <duminjie@vivo.com> wrote:

>  linux-cachefs@redhat.com (moderated
>  list:FILESYSTEMS [NETFS LIBRARY]), linux-fsdevel@vger.kernel.org (open
>  list:FILESYSTEMS [NETFS LIBRARY]), linux-kernel@vger.kernel.org (open list)

In future, could you edit the comments out of the email addresses, please?

> key might contain private information, so use kfree_sensitive to free it.
> In fscache_free_cookie() use kfree_sensitive().

There's no real point.  These are written as filenames (possibly base64-ish
encoded) on disk by cachefiles and represent the information given to the
server to indicate the file (in afs, for example, that's cell name, volume
name, vnode number).

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

