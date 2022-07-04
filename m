Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCB564B11
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Jul 2022 03:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656897244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3hP6ZT4G8hRprUAfnw7k0C8rlyMFtw1YzK9DTSGLKNA=;
	b=KcMIO8jsDZeC8CCxnqZFBco5dmMizMyUS6rwr2DJh9jKkiKbYDpLSgv5aS3JwMvSRyfTEF
	J1tJ7mUVDnTKyt6J2T8SL2iQVHm8Q28O0Zsl5A8D2dPSY1+GCXfo91jdB7XBQ6XSX+nEeE
	sSBQtes2/AspRemZDmGbS2Bo34i8UcI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-yLALc7lNPxyzvE3DwGzyKQ-1; Sun, 03 Jul 2022 21:14:01 -0400
X-MC-Unique: yLALc7lNPxyzvE3DwGzyKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3868001EA;
	Mon,  4 Jul 2022 01:14:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB032026D64;
	Mon,  4 Jul 2022 01:13:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 45C5D194704D;
	Mon,  4 Jul 2022 01:13:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37D4C1947041 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  4 Jul 2022 01:13:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA23940334D; Mon,  4 Jul 2022 01:13:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C60F6416390
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 01:13:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD3C1811E76
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 01:13:55 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-xb_oC-S1OnKlsd1A_IsskQ-1; Sun, 03 Jul 2022 21:13:54 -0400
X-MC-Unique: xb_oC-S1OnKlsd1A_IsskQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d18-20020aa78692000000b005283cfd14e3so1249393pfo.18
 for <linux-cachefs@redhat.com>; Sun, 03 Jul 2022 18:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nv3kLqVRpORhA1eU8Voo6ss8wDxc+AM8OLmudfWCLYs=;
 b=HfKZprK31LYk8En/xM46pkoAWRralAmXhABrfcGuL0xomoRbsPB5XiGwuevjwT/oDN
 OxSGHuObsG/gJ2YXji6ORY+ehea3f1crJ8bZ3w+bcJV7uLABWbGUDVlmEG1Z+qU9JFzu
 itx0DVlrC9+H94nCOUAYS8XupTPtpZ96fdq0Nqk6EOtn57eHwrUD6h7wEe/kdlbghDpR
 MW7WSfkoe1KdSQkOxbxEFX/0PBaqSydesvYHl7Y1ClYDFScK7KulCQHIxrd7c8zlTzOD
 eJvycx6cvxxT2PWo+Uk/B1LZbzBY+e/EZV5CHPrFGOUNDVZsY1BriosEBa4TfL1UaRLm
 luUQ==
X-Gm-Message-State: AJIora9a/0j0Oi0NxBsJ1vD62z+Wq0jJlN4L6MbCFDnehV306XYBq3rq
 UmyYpgDZE0iyeo362paN+uKagig4+9kF56EcnF1eQHGuNCjLmzIDoCMiVRZRuOVrqOXgB3qBYKh
 LsM7u/XbhJv5MnAei9xlyS8CcjR8gO8bOFtmuT4w4wMwVvlmvU7uzB7h/1nKXEl9qbmfMVQY=
X-Received: by 2002:a63:33ce:0:b0:40c:5487:6e6d with SMTP id
 z197-20020a6333ce000000b0040c54876e6dmr23506182pgz.135.1656897232979; 
 Sun, 03 Jul 2022 18:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+HireMspFAh1WUDJ6ByKYptcG3louApKnYoE9dNmZU5NVDm+4O8N59fgytQgg2A5L4LbblA==
X-Received: by 2002:a63:33ce:0:b0:40c:5487:6e6d with SMTP id
 z197-20020a6333ce000000b0040c54876e6dmr23506145pgz.135.1656897232639; 
 Sun, 03 Jul 2022 18:13:52 -0700 (PDT)
Received: from [10.72.12.186] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a656851000000b003fdc16f5de2sm19407912pgt.15.2022.07.03.18.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 18:13:51 -0700 (PDT)
To: Jeff Layton <jlayton@kernel.org>, idryomov@gmail.com, dhowells@redhat.com
References: <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
 <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <f55d10f8-55f6-f56c-bb41-bce139869c8d@redhat.com>
Date: Mon, 4 Jul 2022 09:13:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"


On 7/1/22 6:38 PM, Jeff Layton wrote:
> On Fri, 2022-07-01 at 10:29 +0800, xiubli@redhat.com wrote:
>> From: Xiubo Li <xiubli@redhat.com>
>>
>> The lower layer filesystem should always make sure the folio is
>> locked and do the unlock and put the folio in netfs layer.
>>
>> URL: https://tracker.ceph.com/issues/56423
>> Signed-off-by: Xiubo Li <xiubli@redhat.com>
>> ---
>>   fs/netfs/buffered_read.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
>> index 42f892c5712e..257fd37c2461 100644
>> --- a/fs/netfs/buffered_read.c
>> +++ b/fs/netfs/buffered_read.c
>> @@ -351,8 +351,11 @@ int netfs_write_begin(struct netfs_inode *ctx,
>>   =09=09ret =3D ctx->ops->check_write_begin(file, pos, len, folio, _fsda=
ta);
>>   =09=09if (ret < 0) {
>>   =09=09=09trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_b=
egin);
>> -=09=09=09if (ret =3D=3D -EAGAIN)
>> +=09=09=09if (ret =3D=3D -EAGAIN) {
>> +=09=09=09=09folio_unlock(folio);
>> +=09=09=09=09folio_put(folio);
>>   =09=09=09=09goto retry;
>> +=09=09=09}
>>   =09=09=09goto error;
>>   =09=09}
>>   =09}
> I don't know here... I think it might be better to just expect that when
> this function returns an error that the folio has already been unlocked.
> Doing it this way will mean that you will lock and unlock the folio a
> second time for no reason.
>
> Maybe something like this instead?
>
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 42f892c5712e..8ae7b0f4c909 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -353,7 +353,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
>                          trace_netfs_failure(NULL, NULL, ret, netfs_fail_=
check_write_begin);
>                          if (ret =3D=3D -EAGAIN)
>                                  goto retry;
> -                       goto error;
> +                       goto error_unlocked;
>                  }
>          }
>  =20
> @@ -418,6 +418,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
>   error:
>          folio_unlock(folio);
>          folio_put(folio);
> +error_unlocked:
>          _leave(" =3D %d", ret);
>          return ret;
>   }

Then the "afs" won't work correctly:

377 static int afs_check_write_begin(struct file *file, loff_t pos,=20
unsigned len,
378=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct folio *folio, void **_fsdata)
379 {
380=A0=A0=A0=A0=A0=A0=A0=A0 struct afs_vnode *vnode =3D AFS_FS_I(file_inode=
(file));
381
382=A0=A0=A0=A0=A0=A0=A0=A0 return test_bit(AFS_VNODE_DELETED, &vnode->flag=
s) ? -ESTALE : 0;
383 }

The "afs" does nothing with the folio lock.

-- Xiubo


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

