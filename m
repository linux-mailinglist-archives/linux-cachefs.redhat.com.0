Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBVFZUKYQMGQEBPVJOXQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EBB8B0145
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Apr 2024 07:47:02 +0200 (CEST)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-61b330409b7sf97421707b3.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 23 Apr 2024 22:47:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713937621; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lz2x9bcv02NOmCZobGHv2i9vDZZ0oG1MHzYt+gQ2X7ybICg6jrL7mlS64diu8V1aic
         qOCt02229ufq6SwUygIpKh4Oe+AE94xffXzWKUbGFJQKMm/k1sCj/J3MPyVxK655ZksU
         9vQ5kxIb1u06PPdDAU5vb5G9Brvo5qa8HGuq8AXjgdPTzvwVrcHVJ4+5WD1QdTpbatEG
         n4Qnyxovx+8JD9wBux36vZNmFA1rSX9OpRnODY5JiIVufKqolpDfG/Wc+T7+/Mj5qVN8
         y7MggzJk4PYwJj15YaB+xy8Nu1hpUraRMkqlQ4BTd4KuWcVfjSWWd8sRmr4WQu5ixOOI
         s6Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:delivered-to;
        bh=l4GN9L1h9NGML/T8pMBA6mypEkexHwvPm2Q6573jCiw=;
        fh=/HlNXKuVV7gQVfUezKkDsa4LFpGUkr03WJLJ2pO6FdQ=;
        b=ubSpF+Myt/GSiRe7QeudzRyn72sekvfW9599oOGF3jWR0qXc7M1uQ6jDCjBXkRHiYq
         16sSz4Dql9NMGX0z98ixrCgzh6pw+TipvHALyVTPTm/vsPIOZAw/s+4I0I42SYKiNRgt
         SyGodWdJTgkOMfeOUiAbA8tfZEgHsJIm80sHhKoIsAZx/GW3OJ3TSr+Tq8ME4WmwJ8VP
         g+SH5iQ7Ot46ckkDiT5jqMm+r/Z7DtaC4ICK63QGfVcDIJiPeuXm+UFGfg5kOrkan/ee
         +3PurI8U44m32vr7EQd6dUw/aglB8jBmXsSt92ZnYxqDO07G/Z99kAp56SuTTxnu8q2Z
         n30Q==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.167.177 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713937621; x=1714542421;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l4GN9L1h9NGML/T8pMBA6mypEkexHwvPm2Q6573jCiw=;
        b=SaKVgWzsZZwePNd57Z4CTUW8d6XCRUQd40SC5yHM2qxgboghrsRq3glhqTIbLTFfH7
         6+f0FC7N2ZZ5zBWqv6g5kA+SSE4U9HS1jyLVls3uELYVoQLsqHQ72+/gKaR+KUFSQufR
         W00NkYyybw8sPXenfAQ4MKv0FaeUokg2yntn3aVDglHH/0cdqEhgZ/k8ymuvuY/uaYI4
         8g/UAD1uN/5mYd8Htui6jzq2QFC0oTNTaOAVsUWj7iSXA5nuOKfg6yHtzYsPIGHRC1Jf
         RsAY1n19Ne2gAoXfCu7ihQgZF+0Kq2shtKpvlBiBN6jxU0Hje8K8edVWljqKMMfrJtRD
         hHow==
X-Forwarded-Encrypted: i=2; AJvYcCW1JtMyEjXd3a1K85cgkNCJ4uIYPcpWHR2Nessp0zqCmFeZApj4JsZN8ujF4I0J5H2ZAPC4zvsC0lkPUG3AsGr/7Q+MHgxsHtEBMeE=
X-Gm-Message-State: AOJu0YzKG7fufy/76P5nj18kiYt2DU3a++CT+wcrGNh+FDjx7QVV9VMD
	us/yz7sd8OZZyfXz1ljI83QD+rliucRebkT7dB8fnkoZdT3Mi1kue0dn/S5xYDA=
X-Google-Smtp-Source: AGHT+IF5UZS+47HEhshCgI/FX0iYRB0pak2TmNSU9P7yPPZKx6BdZfhCzxIQ7O0K+/SJ26YpsxFsfQ==
X-Received: by 2002:a05:690c:668c:b0:615:3996:5c86 with SMTP id hz12-20020a05690c668c00b0061539965c86mr1751409ywb.21.1713937620739;
        Tue, 23 Apr 2024 22:47:00 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5d05:0:b0:439:7147:ab57 with SMTP id d75a77b69052e-4397147b69els54004021cf.2.-pod-prod-05-us;
 Tue, 23 Apr 2024 22:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD77oZNb09VCCh82Pm/RjyCy85dbsAmM3Q7eUG+WuqxGx4XUnz80Qrd295VDmdmzZqacUreo7nk0YJqoO8s5iI0I92Ks/4pR426wbKNeA=
X-Received: by 2002:ac8:58cb:0:b0:436:4d7c:8a9b with SMTP id u11-20020ac858cb000000b004364d7c8a9bmr1761282qta.46.1713937620134;
        Tue, 23 Apr 2024 22:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713937620; cv=none;
        d=google.com; s=arc-20160816;
        b=EBY0DXLM+RcSUm4hvmJ0JEjDh6CGAWG85eTTwrST9pJzqRCgxQmnvHEgGE32OrW9us
         3AIz8y7nlMTpYDImUyioB/dQdKiQzyORknznZlh1gOPFuymZZjfhsVDbfZwL6KM7cdSw
         bVAHDczZIluOyyJlNYFxPCjRGrEKbctDbKnM7s355XI1ckpdwx2ugbvpeSn+G3u3VTnf
         ITTDLBkJtSQnWYEbxeeUlxgvBbFZFItjVU95RdoqUF8PIoDMvJI1Dtnu2pnRO9deXoFP
         aQ5TUj0jxhIym1zPBk84Cq6+vzjEHBvgZx6ZZ0mxFCNm7KqTG5KESGZlK9gUvyMRD95n
         +JAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=oav/nBjbNQkJSHj491t5Rtmwwi8lc2zcpFduDWDdqHo=;
        fh=IphXAy6jV8ldGNb85AMubwR/FPPSwIUKd5g9K+HAMpM=;
        b=chStP9pUuXe0Ch6Z4u4JvAAghtTrWxeIj02LNdLxh+i7yWpA2pYUP00DWXe1SDOD7A
         +LW0ykE3oDeAbNQpctxNZ2a8D87s0Ppv64Wvxd46IVEyvdTo2NSYcyHC7HoMN5zMRUFS
         H0E2BkyHaHIKdFQJjLXVMvQlO2TI/Z7pPQY27V9+iuWmQfAbKyIGhp3yWOhhCwyfpWhH
         /n8Fi7mxhriRCLDb95ZoMIdMkflSkR2bT8vjsyaOCTCg8IOcKeC59v0Wn+MaKTzLDBu8
         VtC+4juZ7HX9vNPOrqyFbD26jUI+HIvXj+NVjETXF7YIt38DLuAszMtKsw7vO7DcssCD
         EvRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.167.177 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id 1-20020ac85701000000b0043a198927fesi953758qtw.428.2024.04.23.22.47.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 22:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.167.177 as permitted sender) client-ip=209.85.167.177;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-t8yAwXx4MsK13kEHwz79iw-1; Wed, 24 Apr 2024 01:46:58 -0400
X-MC-Unique: t8yAwXx4MsK13kEHwz79iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 819EE81F309
	for <linux-cachefs@gapps.redhat.com>; Wed, 24 Apr 2024 05:46:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7D5D4490EB; Wed, 24 Apr 2024 05:46:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA32581DC
	for <linux-cachefs@redhat.com>; Wed, 24 Apr 2024 05:46:58 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD7E21049897
	for <linux-cachefs@redhat.com>; Wed, 24 Apr 2024 05:46:57 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-i6XMnEqNMKqfWck0wNwqJw-1; Wed, 24 Apr 2024 01:46:55 -0400
X-MC-Unique: i6XMnEqNMKqfWck0wNwqJw-1
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c70ef25e19so3323312b6e.3
        for <linux-cachefs@redhat.com>; Tue, 23 Apr 2024 22:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrVTQ+WBNwDNwWCKKW/jj98fuEpNe6XFpU4vT5lw1H8Suf8EcchQ4sr7pdAVFjLZY72kDAwR5tOYRr82e5vx/KtMHoW/LkVII=
X-Received: by 2002:a05:6808:170e:b0:3c6:6e1:b166 with SMTP id bc14-20020a056808170e00b003c606e1b166mr1792336oib.28.1713937615179;
        Tue, 23 Apr 2024 22:46:55 -0700 (PDT)
Received: from [10.3.132.118] ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id j9-20020a056a00130900b006eae2d9298esm10560634pfu.194.2024.04.23.22.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 22:46:54 -0700 (PDT)
Message-ID: <a2593b0a-1ddc-4f87-8b6d-68900fdcf612@bytedance.com>
Date: Wed, 24 Apr 2024 13:46:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] cachefiles: add missing lock protection when polling
To: libaokun@huaweicloud.com, netfs@lists.linux.dev
Cc: dhowells@redhat.com, jlayton@kernel.org, jefflexu@linux.alibaba.com,
 linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Gao Xiang <hsiangkao@linux.alibaba.com>, Baokun Li <libaokun1@huawei.com>
References: <20240424033409.2735257-1-libaokun@huaweicloud.com>
 <20240424033409.2735257-6-libaokun@huaweicloud.com>
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
In-Reply-To: <20240424033409.2735257-6-libaokun@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.167.177 as permitted
 sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Reply-To: Jia Zhu <zhujia.zj@bytedance.com>
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



=E5=9C=A8 2024/4/24 11:34, libaokun@huaweicloud.com =E5=86=99=E9=81=93:
> From: Jingbo Xu <jefflexu@linux.alibaba.com>
>=20
> Add missing lock protection in poll routine when iterating xarray,
> otherwise:
>=20
> Even with RCU read lock held, only the slot of the radix tree is
> ensured to be pinned there, while the data structure (e.g. struct
> cachefiles_req) stored in the slot has no such guarantee.  The poll
> routine will iterate the radix tree and dereference cachefiles_req
> accordingly.  Thus RCU read lock is not adequate in this case and
> spinlock is needed here.
>=20
> Fixes: b817e22b2e91 ("cachefiles: narrow the scope of triggering EPOLLIN =
events in ondemand mode")
> Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Thanks for catching this.

Reviewed-by: Jia Zhu <zhujia.zj@bytedance.com>

> ---
>   fs/cachefiles/daemon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index 6465e2574230..73ed2323282a 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -365,14 +365,14 @@ static __poll_t cachefiles_daemon_poll(struct file =
*file,
>  =20
>   	if (cachefiles_in_ondemand_mode(cache)) {
>   		if (!xa_empty(&cache->reqs)) {
> -			rcu_read_lock();
> +			xas_lock(&xas);
>   			xas_for_each_marked(&xas, req, ULONG_MAX, CACHEFILES_REQ_NEW) {
>   				if (!cachefiles_ondemand_is_reopening_read(req)) {
>   					mask |=3D EPOLLIN;
>   					break;
>   				}
>   			}
> -			rcu_read_unlock();
> +			xas_unlock(&xas);
>   		}
>   	} else {
>   		if (test_bit(CACHEFILES_STATE_CHANGED, &cache->flags))

To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

