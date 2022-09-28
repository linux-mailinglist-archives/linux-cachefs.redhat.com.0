Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B25ED8D9
	for <lists+linux-cachefs@lfdr.de>; Wed, 28 Sep 2022 11:24:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664357045;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BAtEGyXImrfxzABcWcF57ARp5J3JUuVuZv2X6cA/uOc=;
	b=fnpwTAzmdozLdWehxDFwoWSJXUg2GCkjkGfXWuW54PdPDoeytZhjuATogWAjnS80i9FRA6
	8Q+Nr0tqpEPq4LBmfPFmhrmscQTyKelD9QlYBGkFfLG/bwKskYpMgTIoiAVNmoQ7Us2oPX
	rA9wODEEE3Dx+U9UXxYnbFu5GAuD0Is=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-fSLPkqMJPq-oXfHbn9Zf8Q-1; Wed, 28 Sep 2022 05:24:01 -0400
X-MC-Unique: fSLPkqMJPq-oXfHbn9Zf8Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D6EB3C0E205;
	Wed, 28 Sep 2022 09:24:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B02F2492B04;
	Wed, 28 Sep 2022 09:23:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52C431946A45;
	Wed, 28 Sep 2022 09:23:58 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B17FF19465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 28 Sep 2022 09:23:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EE99145BA4C; Wed, 28 Sep 2022 09:23:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A1C145BA49
 for <linux-cachefs@redhat.com>; Wed, 28 Sep 2022 09:23:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE1E6811E67
 for <linux-cachefs@redhat.com>; Wed, 28 Sep 2022 09:23:56 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-qO2AR1NiO5Oiekmr44jK8Q-1; Wed, 28 Sep 2022 05:23:39 -0400
X-MC-Unique: qO2AR1NiO5Oiekmr44jK8Q-1
Received: by mail-vs1-f52.google.com with SMTP id m66so12060575vsm.12;
 Wed, 28 Sep 2022 02:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=N4sJdYiEPta5eHA2aSs5jqQt99tQBvgcHVJEn8oUpUE=;
 b=jkk00jxc3pNIGznQl/tPK+7iUbjYSR2M8tiwkPqU38t3C/gyQ6n99SH/sTgKyTeG2M
 cCkVp9ZtEW5Mpr2cX1hL3PGH6CKEKxsMJri1kc1gXpBP18muXgT/V1QrYht4lQXDYOMR
 96mSaX9gff9k7DjBt5sPKIX4jSwxdnfAme+PPsueU4mQvc3W6uW666a4wR/4gCCV+8+H
 MyYjrr7jUIw4bifHkXzkOiW+FkDzfpi8pvg1lFjL8DUIse+OVoadjCI/54yishUHXDyc
 x/hHBySoGk5vJXuIFbivY9xTvkFBvl8xQmO59SvE5IUMdHwO6ncxHzAbXmeXbWE5ewJm
 vt0A==
X-Gm-Message-State: ACrzQf1mMf13HpYz5Hrvmx9S3nCS2VuUlsbhW75QLxCB7vAToTpQncDj
 ojKZ+P6tVwHyisuLbXtL6dXT1I07u/aiQ7JExVE=
X-Google-Smtp-Source: AMsMyM6ahUMvKegbswPOa40sujoYUJbtET6Q3gm7zQCxkiRQK/vYAYnRE8DBqkoBCtEQEL6ou375gDO5PSAE5Eyql6s=
X-Received: by 2002:a05:6102:3f8e:b0:390:32b1:ed15 with SMTP id
 o14-20020a0561023f8e00b0039032b1ed15mr11797413vsv.8.1664357018966; Wed, 28
 Sep 2022 02:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f2b07b05d5dc87cc@google.com>
 <00000000000093aefb05e9b93343@google.com>
In-Reply-To: <00000000000093aefb05e9b93343@google.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 28 Sep 2022 17:21:40 +0800
Message-ID: <CAD-N9QWpDpP5YGwq363Z1jDOeEK+S1JjNGmiZsD4KimZSkowgw@mail.gmail.com>
To: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [syzbot] general protection fault in
 fscache_free_cookie
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
Cc: linux-cachefs-owner@redhat.com, linux-cachefs-bounces@redhat.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 nogikh@google.com, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 28, 2022 at 5:15 PM syzbot
<syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com> wrote:
>
> This bug is marked as fixed by commit:
> fscache: fix GPF in fscache_free_cookie
> But I can't find it in any tested tree for more than 90 days.
> Is it a correct commit? Please update it by replying:
> #syz fix: exact-commit-title
> Until then the bug is still considered open and
> new crashes with the same signature are ignored.

@Dmitry Vyukov Why syzbot continuously complains about this bug
report? The fix commit looks correct.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

