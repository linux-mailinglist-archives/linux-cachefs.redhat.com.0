Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBOPCVCVAMGQEL6WY6LQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mail.lfdr.de (Postfix) with ESMTPS id A90267E3EE6
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Nov 2023 13:44:43 +0100 (CET)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5b1ff96d5b9sf77531057b3.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 07 Nov 2023 04:44:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1699361082; cv=pass;
        d=google.com; s=arc-20160816;
        b=xrMlrcJhFyTUMWTwlWQmw07ojBp34aTveZ4idZWR6TJXIQ6kMG17+IrTtbgOs9vB80
         9hKwZh8z8yovUkvik3K11aVaVnnwdOAcyvK1NBLOiEddg7xefKGKTbJJC9SzAH+xvqmV
         Tw9lJuJ1Ro7GlfJihza0ArvH+4z1qBr6n32AB+cAsS3JS01nbqQtGF7/NelISLVlqJXO
         PEcmbjJcn1dcF15MFzfMgoZ0tY/5RG+4rhPyIG8x+6OmUKMiPUe+tGOHzJNuO4Hfx0Y/
         h+sqwAWtSDRLa59xUfGzpwb6HNxH6PRFABCQucs6uWihbKarmpq2lV4OM1N4ydZUHngx
         yEzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :delivered-to;
        bh=PyYJLsHgyF5qYbepP6/eKvNiS4cLMHdEFVMdn6fdTEA=;
        fh=fQ2ixLmgbfTIXwu2ILqaBMK+IB4mjKOkTtSrJWEhQGs=;
        b=oogZbufIlCCGeuPvdu/irjWsqkRayJqHjoGQhM4AzkKJOV2v0GffRHdds8sKWpl0e0
         T9Gl5ScuF1Yp0skGzviiUBeU2P0EbRM9YgGHFNCHmbLNQhBqIa4BXFw3idX/6bKDr13B
         kxWqaZ0gu6QQ8XcCpn7DzGAOp/sND0490/GZ+x1T+ekGDMhuC2gD3OZxTkpi0NKF1E6j
         McCn7E1Bhy22LR/aCBXE51kL5YR1mkdcFGCHcSQm2IyszAuyVhVaHbAtuOSSYFPjN+li
         EdBULfDUt7/Vz4aLKJEtb5Wl79pSNQi8ej91E/9exv34/AnvbA42r+2D1RrTuXQE2cnf
         NAdQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699361082; x=1699965882;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyYJLsHgyF5qYbepP6/eKvNiS4cLMHdEFVMdn6fdTEA=;
        b=Ls7hGCDfh7dujTjRR5xxB9l9ly0ScHYNPyBXRPWbRBcpFCWIh8M/r3HrsEztOCKLrm
         3TR3yl63N/0GLJ2DIzuc16txTjQD+Gxw3lXDd20/YVrDx9thBwukZGJFPxhnEvAphw5K
         ceg55JjGP+Jh/f1yJtO2TFnaYjnTUd0+nuEOK6NX0771vt2XGgkv8cfdnV4crZJScqtz
         2plC7rT/epq5pXFszdkfZKJUS2Nlq7TY2fItOCV83PlVzYejbPHXKQgMstNkqSvnsG2C
         +i+00Pnr5ty4o2G3HZunTacJqZ5qIw5yRUirGj+G2CaR7GnRK9lkWAxdONp76UrTQLZR
         ebiA==
X-Gm-Message-State: AOJu0YzPHnmOxrgLpBTQmVARu4dGvLjA5BWsMbWXE+T+zYNXJQYxjH3Q
	lv92LFtA/idDuadc8whz4XgCYA==
X-Google-Smtp-Source: AGHT+IFtHTRnPgaDxwVcLXM0kyLLA5G+jfKbqXrQ9LysdA028kuksVnn4oL+XfoncLXycFu0rMaLVQ==
X-Received: by 2002:a25:9f8f:0:b0:dae:263e:5007 with SMTP id u15-20020a259f8f000000b00dae263e5007mr6176208ybq.52.1699361082358;
        Tue, 07 Nov 2023 04:44:42 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:3d87:0:b0:d9b:d44f:f44e with SMTP id k129-20020a253d87000000b00d9bd44ff44els170735yba.0.-pod-prod-01-us;
 Tue, 07 Nov 2023 04:44:39 -0800 (PST)
X-Received: by 2002:a25:f811:0:b0:da3:76d7:ddcf with SMTP id u17-20020a25f811000000b00da376d7ddcfmr21968380ybd.14.1699361079525;
        Tue, 07 Nov 2023 04:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699361079; cv=none;
        d=google.com; s=arc-20160816;
        b=gA+JanlAwiWXjRjAfQFcQn5bBiXYEgA3sJGvY3jx0/JaizIBhBK6vf/5/edXhqDTWA
         uiRyRyq+gD/kPViTidh5bydlXe8IC3MSivpehYV4xsU9EurI8nTEjoDFRcYOhzB4OP0I
         Rjfg6OvjulX6g8UJaAz1/Qme+ZyaOC2EYDiJPUVUkHjLjKDg7gu7gX7sr251WWaZ3B0C
         tfKhhErA82EkyHnhRyn5nDFU8bvaq2kfJtoVx8PKv1mHQWzpplKORn+pL+Keg27QOVfK
         b/L0uVGh24K49Jm+To25Y3clX7G31mz/Hmag5SpiLekIHr47B+QdQ5zQliQWQbOwLuHh
         aNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=oOVhbCAi0YNNH2hg+E/S9FYULUjPxKBB4Twvf/qKWwY=;
        fh=fQ2ixLmgbfTIXwu2ILqaBMK+IB4mjKOkTtSrJWEhQGs=;
        b=K60K9mcKMXgCBvSac1KnU7PxM98hUFSMTD7c/VqyMZbPEQArfobK0NxeObsn5Z7Dvr
         63jmQ1rnTukVYChFngXV7abn5acBqYPJ3nAQwsRxEd/AGz6w0oSTCGbB1J4qDet96hI7
         r3JaXDunehKduQ3tp27OmuiFYfoSS9UYHKNZaZADWr0NizeRmZHKYp6eJGC8LIpDRh33
         CpaKnWZdGsOesQtr+8MEX0T7JhksN2IqqBI2I9G234DwVPAF4QcStTfI1wFUX/oNuOPi
         AevENryf4065wJoGy1PVm6/0cAO1sHKe3oKkGVF3UDavVla+cCTSbAhbGvS3U3WwpRFt
         JSKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id n6-20020a056214008600b0065b086dcab8si6806382qvr.457.2023.11.07.04.44.39
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 04:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) client-ip=115.124.30.124;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-CMj3b2jQPYyASiLRNr6a_g-1; Tue, 07 Nov 2023 07:44:38 -0500
X-MC-Unique: CMj3b2jQPYyASiLRNr6a_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D5FE88D70A
	for <linux-cachefs@gapps.redhat.com>; Tue,  7 Nov 2023 12:44:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1A659492BE7; Tue,  7 Nov 2023 12:44:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 138DA492BE0
	for <linux-cachefs@redhat.com>; Tue,  7 Nov 2023 12:44:38 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFAC1101A52D
	for <linux-cachefs@redhat.com>; Tue,  7 Nov 2023 12:44:37 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-441-m0k0eNkgM5WQvU-QjEwmdw-1; Tue, 07 Nov 2023 07:44:33 -0500
X-MC-Unique: m0k0eNkgM5WQvU-QjEwmdw-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VvuU5zg_1699360752
Received: from 30.25.227.158(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VvuU5zg_1699360752)
          by smtp.aliyun-inc.com;
          Tue, 07 Nov 2023 20:39:16 +0800
Message-ID: <32abf57d-d3bc-d812-c70f-bba8356162ff@linux.alibaba.com>
Date: Tue, 7 Nov 2023 20:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH -next,V2] fscache: support to disable assert macro
To: Zizhi Wo <wozizhi@huawei.com>, dhowells@redhat.com
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
 yangerkun@huawei.com
References: <20231101163414.2105727-1-wozizhi@huawei.com>
 <d3a50c46-93c9-4b60-8609-9465e1605f77@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <d3a50c46-93c9-4b60-8609-9465e1605f77@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted
 sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
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



On 2023/11/7 18:16, Zizhi Wo wrote:
> friendly ping
>=20
> =E5=9C=A8 2023/11/2 0:34, WoZ1zh1 =E5=86=99=E9=81=93:
>> In fs/fscache/internal.h, ASSERT macro is enabled by default and can not
>> be disabled, then assert failure will crash the kernel as the BUG() is
>> included in the ASSERT macro. Therefore, add FSCACHE_ASSERT to control i=
t.

Personally it looks good to me, yet we could also turn
them into WARN_ON_ONCE case by case? Anyway, it depends
on how David thinks...

Thanks,
Gao Xiang

>>
>> Signed-off-by: WoZ1zh1 <wozizhi@huawei.com>
>> ---
>> =C2=A0 fs/fscache/Kconfig=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
>> =C2=A0 fs/fscache/internal.h |=C2=A0 2 +-
>> =C2=A0 2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/fscache/Kconfig b/fs/fscache/Kconfig
>> index b313a978ae0a..7ff844038bc3 100644
>> --- a/fs/fscache/Kconfig
>> +++ b/fs/fscache/Kconfig
>> @@ -38,3 +38,13 @@ config FSCACHE_DEBUG
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled by setting bits in /s=
ys/modules/fscache/parameter/debug.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See Documentation/filesystems=
/caching/fscache.rst for more information.
>> +
>> +config FSCACHE_ASSERT
>> +=C2=A0=C2=A0=C2=A0 bool "FSCACHE asserts"
>> +=C2=A0=C2=A0=C2=A0 default n
>> +=C2=A0=C2=A0=C2=A0 depends on FSCACHE
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Support the ASSERT mode for failure beha=
vior.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say N here to disable the ASSERT by defa=
ult.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y to add assertion checks in some pl=
aces. But the assertion
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 failure will result in fatal errors that=
 BUG() the kernel.
>> diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
>> index 1336f517e9b1..951166ed772f 100644
>> --- a/fs/fscache/internal.h
>> +++ b/fs/fscache/internal.h
>> @@ -225,7 +225,7 @@ do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>> =C2=A0 /*
>> =C2=A0=C2=A0 * assertions
>> =C2=A0=C2=A0 */
>> -#if 1 /* defined(__KDEBUGALL) */
>> +#ifdef CONFIG_FSCACHE_ASSERT
>> =C2=A0 #define ASSERT(X)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

