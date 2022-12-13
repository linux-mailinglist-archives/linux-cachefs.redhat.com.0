Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C364AEF3
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Dec 2022 06:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670907721;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oNtnv9kUhswn2G8bkpFExxU9c8e6GeyBumj/vDyjBac=;
	b=Ctuv8oQps2yKh7q+pzHqbTpfTLRZJylyBF1/yit4Y85WUuvwbM/areEr0Y5c3UwrPCSzMd
	0rWzRLEZK6T24oKODlVPW3FC5WJRhZnSZfkfjxQ1tPF6Pb1QNsqThaXOGpyWz1/KVSMIql
	Cwe4PI3zJu9lr1Xh691uwj8SxvAycbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-C-UU2xWZOJ2S1uYMD2_rXA-1; Tue, 13 Dec 2022 00:01:57 -0500
X-MC-Unique: C-UU2xWZOJ2S1uYMD2_rXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB3386C046;
	Tue, 13 Dec 2022 05:01:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4240492C14;
	Tue, 13 Dec 2022 05:01:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BD9F194658C;
	Tue, 13 Dec 2022 05:01:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE5001946586 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 05:01:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E78AC40C2004; Tue, 13 Dec 2022 05:01:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E0040C2005
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 05:01:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD1F185A78B
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 05:01:49 +0000 (UTC)
Received: from out199-5.us.a.mail.aliyun.com (out199-5.us.a.mail.aliyun.com
 [47.90.199.5]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-pG6VxTvWNiSsXawYayWEbQ-1; Tue, 13 Dec 2022 00:01:48 -0500
X-MC-Unique: pG6VxTvWNiSsXawYayWEbQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=hsiangkao@linux.alibaba.com; NM=0; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VXCTSqP_1670907394
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VXCTSqP_1670907394) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 12:56:36 +0800
Date: Tue, 13 Dec 2022 12:56:33 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Y5gGAedWBwMgqjAm@B-P7TQMD6M-0146.local>
References: <Y5TB6E77vbpRMhIk@debian> <Y5bRuDiEwUAK1si1@debian>
 <CAHk-=wg44HkHGo-j5HEChEJYqW0-=vu7=i0euGBPT4asc1xBaQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wg44HkHGo-j5HEChEJYqW0-=vu7=i0euGBPT4asc1xBaQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [GIT PULL] erofs updates for 6.2-rc1 (fscache
 part inclusive)
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
Cc: Yue Hu <huyue2@coolpad.com>, Chen Zhongjin <chenzhongjin@huawei.com>,
 Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
 Hou Tao <houtao1@huawei.com>, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 08:12:18PM -0800, Linus Torvalds wrote:
> On Sun, Dec 11, 2022 at 11:01 PM Gao Xiang <xiang@kernel.org> wrote:
> >
> > Comparing with the latest -next on the last Thursday, there was one-liner
> > addition  commit 927e5010ff5b ("erofs: use kmap_local_page()
> > only for erofs_bread()") as below:
> [...]
> > Because there is no -next version on Monday, if you would like to
> > take all commits in -next you could take
> >   git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.2-rc1-alt
> 
> No worries. That one-liner isn't a problem, and you sent the pull
> request to me early, so I'm perfectly happy with your original request
> and have pulled it.
> 
> Thanks for being careful,

Thank you, Linus!

Thanks,
Gao Xiang

> 
>                  Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

