Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGGT7OWAMGQEOIFI2EI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id A888B82A09D
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Jan 2024 20:01:46 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-594ed6d469csf3244541eaf.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 10 Jan 2024 11:01:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704913305; cv=pass;
        d=google.com; s=arc-20160816;
        b=02gEqoSLoM/n866PfyHhUjsqZFcWt49q9x1TM9eaGPQxcXSHe85GKGLesjRXBYl2Y+
         hcKxY84Tzn0dbfhZ5AcP4u/mehgF/csUCzomoh7xuukqTGbx57TUbYZKVYRHdyMiKJ3q
         cagNW9qfIVXRmEaSDKPiI5zIX0XCcc1pPv/haqc8KMz9JK3xMcmuDvj/dScScRDjqn+f
         jufsJI1GiNJzGykn75bBKm4y4x1e4qtf2RG5h8Os4fjQ4c5QfQIz9OpT+1+4/fLA4Z4k
         J4t2x/yEjX3qDjcZddhGOGWXhPpdUzcn6PMTlmfhywoTkS4eztNw+5utKGMHJS5vWHJt
         fLyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=ID34Od2iTXIKvNQ+mURMgdq3I5Qi+KXKD9zw6qQH+R4=;
        fh=gMdau9lDuxSEMg0SjFV8L8RZWfMUb12kJE1HQhVfWnk=;
        b=AKrXGprJaDfsJPL+rMpH9Wf/XVwYQ34hifmgWtWgWWp+M3eA2SO/GvZL8KlBfAlJsM
         vAT4taFHV7QzDnnyTT7sAHD7vVVgWZBMzWigNQSf2iuPJ+atHA6mTHSddeNK66C6JOSx
         E+TgknWAHFgEsFL8UpB9vvOlXQjhUUYUeDt3XHzLvgQh3/nAvll5jSzexmu+h+m6qaoZ
         tgXonJv6hn+TOKwl20IDCqdMjs7DRk+eakzCtiMGJ0fxhAAH5ExGsfC4nmeFuagGRut/
         zzDe9fWFPlSmFWwD/KceomWrCfybb95tz2p14C8rAkGGm0PW1Tw0mmiotKnOxVDLTLXU
         zjxw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704913305; x=1705518105;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ID34Od2iTXIKvNQ+mURMgdq3I5Qi+KXKD9zw6qQH+R4=;
        b=gXk6LdcfkTBfFrGvhTmwGRH0aPe/Br4F90mP0rLNBbwlZIQvOFxhfSsDi0mwj82U2+
         ODe8nc9uVlidq3xrTNl8cvC7xuW6npww6Kl7LuxylAfMYxUuIANJgP/wpCkFWgukgb8m
         k3twU2BMWeo2aVRCYoMH5SHVnIBq2g7kD9PxRvWk/ynrP6VGnIZnd+oHcBOnUT1VnaBU
         aOPRGP58kfwQhAsJtWDSeIsLRAuCQyrLFN8ZxXv345V8nKKKf64LQrdoaE8k2GhHqcTC
         fnfn1FaRGd98EF4PamyVApV6OO53HfC3Uwbc1Zb/qv7fuKuCtz3CR0xdwaBu8DlRvp3H
         puYQ==
X-Gm-Message-State: AOJu0Yx5bptkNl9a6JIrj/8LEqUyDW+RN5Ah6SVnFWQSofU0wvW4krK1
	mPUCnkbKo6wPNHuKjSJdgcYDGUWL4EyXBw==
X-Google-Smtp-Source: AGHT+IFXKAIGLPVedTUNHMaIB0kDbY1dx0htS2aBctBtWhp1rciUebFfBjKoCeJH/pD4Irtb2v+q4g==
X-Received: by 2002:a4a:311d:0:b0:595:ffa2:e2e1 with SMTP id k29-20020a4a311d000000b00595ffa2e2e1mr37856ooa.7.1704913305197;
        Wed, 10 Jan 2024 11:01:45 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:340e:0:b0:598:a0ac:c96e with SMTP id b14-20020a4a340e000000b00598a0acc96els659903ooa.2.-pod-prod-06-us;
 Wed, 10 Jan 2024 11:01:44 -0800 (PST)
X-Received: by 2002:a05:6808:1205:b0:3bc:29af:e847 with SMTP id a5-20020a056808120500b003bc29afe847mr63941oil.50.1704913304347;
        Wed, 10 Jan 2024 11:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704913304; cv=none;
        d=google.com; s=arc-20160816;
        b=StMjZJorsUG31VPfCh1NdsO+2EyKL+FSELSvwrrZph1vwclF5x3+jO1h20eiXbsJ/g
         6CGTFiB5/sZ1kl9nYDIGmzGT0I7CjcfhKSkACKA3JUlPZKvtp53JLflrz7RbewPRw0lz
         jASIfFsdyZNneOYBS/eF0MzGc54o3Akg1KqEF9MKDLCpmc8VbCxLX79D0azXD5tC2rIE
         jY/vB2rZ/qBRNbBQ8KHmFofEgd3lbgMHQ14WSh56fGZDeMypYcsGuiJRxM/G3tzpItFv
         h0RgJi+wN4tuK3j1nvR/+NbsBvnabxJKwcbm3apDz4QW8x7Aqm3bGQnM5WA31NCStRXP
         Oifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=pJpTNHjkrdudfIITkK7u4W2zrdtA79u2wxg+UQ854QE=;
        fh=gMdau9lDuxSEMg0SjFV8L8RZWfMUb12kJE1HQhVfWnk=;
        b=yHsMuHbDZWOOgI5BS1+GpjJpoA+uu9eiHjfLnyQngIYeP5NDxAguexyLp9sLBbFMLv
         YD5h5zbJ9bOUHaD1XLdp9vSGN0vsb1Rqs4FpV756dcqhiuy5+Buq7JfN6e3vMEYsqiSt
         XirLe8c5AU/ZKtwtbFQ8BTYcxA0gEf3Enn0UHup2zRGkWOBMyMzC0gnQthFMGsf+jLH7
         L16MtpF5dKu7P75sXUpX8yaHa3wjLoGrtiXjHZZFmgB4NsTjqRxM9yaKVZx1b0udcWdK
         AEMtiPIgHsguiWhbJ+O+f+1Kf0UhdDH2rGnvRTXuT+pypILv/IEcplA5Jwd9JyoJ8eVL
         rhdw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b16-20020a0cb3d0000000b006803463703bsi4802661qvf.129.2024.01.10.11.01.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-9qxqFwGTO56DiRDulGQV2A-1; Wed,
 10 Jan 2024 14:01:42 -0500
X-MC-Unique: 9qxqFwGTO56DiRDulGQV2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F67E1C060DF
	for <linux-cachefs@gapps.redhat.com>; Wed, 10 Jan 2024 19:01:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 29C5F2027045; Wed, 10 Jan 2024 19:01:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 395822026F95;
	Wed, 10 Jan 2024 19:01:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <9872f991-56a8-4915-b9b0-53accd6db0ef@moroto.mountain>
References: <9872f991-56a8-4915-b9b0-53accd6db0ef@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] netfs, fscache: Prevent Oops in fscache_put_cache()
MIME-Version: 1.0
Date: Wed, 10 Jan 2024 19:01:40 +0000
Message-ID: <1788108.1704913300@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1788107.1704913300.1@warthog.procyon.org.uk>
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

Dan Carpenter <dan.carpenter@linaro.org> wrote:

>  	zero = __refcount_dec_and_test(&cache->ref, &ref);
> -	trace_fscache_cache(debug_id, ref - 1, where);
> +	trace_fscache_cache(cache->debug_id, ref - 1, where);

You can't do that if !zero.  cache may be deallocated between the two lines.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

