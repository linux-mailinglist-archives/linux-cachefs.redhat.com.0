Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79A64AE91
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Dec 2022 05:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670904764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PeMFJphUkxp47DxYQgoM+2a4zWyRb4Wu7g3D67hcDRk=;
	b=GszN1HiHeawHaAZovhS9AHLTtCshIQeNJUBzJ8Z/Mv8W759WS3QzJdtMty7ybSzUZsTWA4
	Be344hWZx3BMyYn7L0C5Ex8KSC+s6shmwb/ZuTKNKnNvCgH/kurnbZE3+cc5DqpEXkXUiV
	Jv2iNH9wBAFcfiCa9Lt/GmJYkQ7JqeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-rjwOpqpYMBa3gdqQ6sPflA-1; Mon, 12 Dec 2022 23:12:43 -0500
X-MC-Unique: rjwOpqpYMBa3gdqQ6sPflA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7B9101A528;
	Tue, 13 Dec 2022 04:12:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15FDB1121318;
	Tue, 13 Dec 2022 04:12:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D2C62194658C;
	Tue, 13 Dec 2022 04:12:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D70921946586 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 04:12:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B9B553A7; Tue, 13 Dec 2022 04:12:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 935A5175A2
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 04:12:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F42D806002
 for <linux-cachefs@redhat.com>; Tue, 13 Dec 2022 04:12:39 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-g-NKyJWTOqOiW_RTgRBBYA-1; Mon, 12 Dec 2022 23:12:37 -0500
X-MC-Unique: g-NKyJWTOqOiW_RTgRBBYA-1
Received: by mail-qt1-f176.google.com with SMTP id a16so10916592qtw.10
 for <linux-cachefs@redhat.com>; Mon, 12 Dec 2022 20:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IbX66ZXwXxKVKyE5+d5TwpxRmxyoArAKr+H2f8obyNQ=;
 b=WrTBpVwzDRMFRLK41YDgPoIrtZsODTF+UTOsG+sBjh0H5EQ2jSKCJybmE05+sM94Gg
 PYj8Ql/GccXUJFrALpPz8q0MpjcSRXnQJfsPmfFMKDU7s1nMW2s3O9uakGqx8czq1j3t
 9FQ5ierfL1lxrCl7BvGFpMZ9e6Y4m+St/AaMJGisAGtRgnxjNQ4siizgn87rnehK0XC1
 K5bBI/hUV1E3J5isumv/16hYTsIFwvaEOnGShT8FCRbVJfCohBJxpfh/aCT6cQl33pVF
 9U2w9+eiUFtwOQNHLmtpDuXn0/nY2SbLwyVUw1BMhuV+oCrK0mFMB0qX41gRBJ21K2ou
 im0g==
X-Gm-Message-State: ANoB5pn0Ha/MgqfjnPmucsOqOd/c5aVeCJQNyCpejiJ2fqaeHG1jXP+l
 dmjGku4ZA+iseP6rAPMRm6WCocTDjaVUsktm
X-Google-Smtp-Source: AA0mqf7W0I60LVKb0VXkqP5tgZ3ZWGQPP9M02rnF+NQC0mg5C17khbq6rtRcI8hqPGqb7n+9IZgyDQ==
X-Received: by 2002:a05:622a:1e11:b0:3a5:fa33:917f with SMTP id
 br17-20020a05622a1e1100b003a5fa33917fmr27829356qtb.37.1670904756100; 
 Mon, 12 Dec 2022 20:12:36 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171]) by smtp.gmail.com with ESMTPSA id
 r22-20020ac85216000000b003434d3b5938sm6967688qtn.2.2022.12.12.20.12.34
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 20:12:34 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id p18so6040048qkg.2
 for <linux-cachefs@redhat.com>; Mon, 12 Dec 2022 20:12:34 -0800 (PST)
X-Received: by 2002:a37:8883:0:b0:6fb:628a:1aea with SMTP id
 k125-20020a378883000000b006fb628a1aeamr84330860qkd.697.1670904754152; Mon, 12
 Dec 2022 20:12:34 -0800 (PST)
MIME-Version: 1.0
References: <Y5TB6E77vbpRMhIk@debian> <Y5bRuDiEwUAK1si1@debian>
In-Reply-To: <Y5bRuDiEwUAK1si1@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Dec 2022 20:12:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg44HkHGo-j5HEChEJYqW0-=vu7=i0euGBPT4asc1xBaQ@mail.gmail.com>
Message-ID: <CAHk-=wg44HkHGo-j5HEChEJYqW0-=vu7=i0euGBPT4asc1xBaQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, 
 linux-cachefs@redhat.com, LKML <linux-kernel@vger.kernel.org>, 
 David Howells <dhowells@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <chao@kernel.org>, 
 Yue Hu <huyue2@coolpad.com>, Jingbo Xu <jefflexu@linux.alibaba.com>, 
 Hou Tao <houtao1@huawei.com>, Chen Zhongjin <chenzhongjin@huawei.com>, 
 Jia Zhu <zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 11, 2022 at 11:01 PM Gao Xiang <xiang@kernel.org> wrote:
>
> Comparing with the latest -next on the last Thursday, there was one-liner
> addition  commit 927e5010ff5b ("erofs: use kmap_local_page()
> only for erofs_bread()") as below:
[...]
> Because there is no -next version on Monday, if you would like to
> take all commits in -next you could take
>   git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.2-rc1-alt

No worries. That one-liner isn't a problem, and you sent the pull
request to me early, so I'm perfectly happy with your original request
and have pulled it.

Thanks for being careful,

                 Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

