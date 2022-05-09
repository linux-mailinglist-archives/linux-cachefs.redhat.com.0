Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141851F2C5
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 May 2022 05:06:06 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-J6XiVs5hPP-Yg0XvTpLDzA-1; Sun, 08 May 2022 23:06:04 -0400
X-MC-Unique: J6XiVs5hPP-Yg0XvTpLDzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 317711C05144;
	Mon,  9 May 2022 03:06:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B530C28105;
	Mon,  9 May 2022 03:06:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E79C61947054;
	Mon,  9 May 2022 03:06:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C5EE1947042 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  9 May 2022 03:06:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEF68400E118; Mon,  9 May 2022 03:06:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE3A40D1B9A
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 03:06:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2A9D803D45
 for <linux-cachefs@redhat.com>; Mon,  9 May 2022 03:06:01 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-8gRrbgq9PvOamJOmqvecbQ-1; Sun, 08 May 2022 23:05:59 -0400
X-MC-Unique: 8gRrbgq9PvOamJOmqvecbQ-1
Received: by mail-lf1-f52.google.com with SMTP id w19so21551776lfu.11
 for <linux-cachefs@redhat.com>; Sun, 08 May 2022 20:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPCLl0WNrEQ8X7TZbGk9F5F3Xw31TIAi53cscMQsEGE=;
 b=kXGIjaMic9IkwpoVEf9M6Xxg1mmVThqaesTEhz3a998ZHONRc1ESvCnJYzSYAUHsl8
 8vCojnvD8U9W72WLeSpYpgwcKZ8BpU2cDI/2wAsu3WpFvSUgtwfKZFBqsQPNbRJ/dppk
 WibQwSky7LPX5k8YFVfOvAJ/eGXIMyUHiBNA9s+x5lDInTmCJR+IPQkL9mAGjk2tLBQD
 4aweYLTAc83g++ng+2TDwya7hUaQghYDlVPpxn+dCDayH6UOuRHPiQVdBbERvCpxFHYo
 u4uL/tY3GnWklm17vU2gYyh/J1udpwNeNvGEo+Ofl5FzWSixSngjCzOzRX6aEJ08VMjN
 ngBg==
X-Gm-Message-State: AOAM532KZ/NuZm2+foR7EyTRNG3KtmgBosRHd4h1sssII6kkdGxGZdba
 S3HFFQtGLOSx7BIqon0QzeG0cTgyKeorOeik/30Txw==
X-Google-Smtp-Source: ABdhPJylEsq2ZJj98ROOaWvCI5t7ScvLOENldeObjFe7fZFxjD/+x6tUKQL2zAuBGgq3+2z6PXGp7OAUYFJuce5ib0g=
X-Received: by 2002:a05:6512:13a3:b0:474:2642:d00e with SMTP id
 p35-20020a05651213a300b004742642d00emr2476580lfa.328.1652065558196; Sun, 08
 May 2022 20:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220507083154.18226-1-yinxin.x@bytedance.com>
 <dfcbda24-3969-f374-b209-81c3818246c1@linux.alibaba.com>
In-Reply-To: <dfcbda24-3969-f374-b209-81c3818246c1@linux.alibaba.com>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Mon, 9 May 2022 11:05:47 +0800
Message-ID: <CAK896s68f5Snrip8TYPfDbObOpNoTtWW+0WBXzTiJbadAShGrg@mail.gmail.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [External] Re: [PATCH v2] erofs: change to use
 asyncronous io for fscache readpage/readahead
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
Cc: linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 7, 2022 at 9:08 PM JeffleXu <jefflexu@linux.alibaba.com> wrote:
>
>
>
> On 5/7/22 4:31 PM, Xin Yin wrote:
> > Use asyncronous io to read data from fscache may greatly improve IO
> > bandwidth for sequential buffer read scenario.
> >
> > Change erofs_fscache_read_folios to erofs_fscache_read_folios_async,
> > and read data from fscache asyncronously. Make .readpage()/.readahead()
> > to use this new helper.
> >
> > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> > ---
>
> s/asyncronous/asynchronous/
> s/asyncronously/asynchronously/
>
Thanks for pointing this out , I will fix it.

> BTW, "convert to asynchronous readahead" may be more concise?
>
You mean the title of this patch?  But, actually we also change to use
this asynchronous io helper for .readpage() now , so I think we need
to point this in the title. right ?

Thanks,
Xin Yin
> Apart from that, LGTM
>
> Reviewed-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>
>
> --
> Thanks,
> Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

