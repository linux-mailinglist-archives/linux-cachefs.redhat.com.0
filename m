Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB94DE7F0
	for <lists+linux-cachefs@lfdr.de>; Sat, 19 Mar 2022 13:46:07 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-fz7twbWjMB-1whRAkn5pnw-1; Sat, 19 Mar 2022 08:46:04 -0400
X-MC-Unique: fz7twbWjMB-1whRAkn5pnw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E4333C01DAA;
	Sat, 19 Mar 2022 12:46:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFB94292D7;
	Sat, 19 Mar 2022 12:46:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11BE01940373;
	Sat, 19 Mar 2022 12:46:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E3A21940341 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 19 Mar 2022 12:45:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A5EB2166B26; Sat, 19 Mar 2022 12:45:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55F2F2166B25
 for <linux-cachefs@redhat.com>; Sat, 19 Mar 2022 12:45:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5311801585
 for <linux-cachefs@redhat.com>; Sat, 19 Mar 2022 12:45:55 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-ajgSEvGcNXio0WN5v0cbzg-1; Sat, 19 Mar 2022 08:45:54 -0400
X-MC-Unique: ajgSEvGcNXio0WN5v0cbzg-1
Received: by mail-vk1-f170.google.com with SMTP id d7so5759815vkd.11;
 Sat, 19 Mar 2022 05:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOMGYmaATQC2z13UyvSGmscWZ1Ke2cRO2FHb2Uve4+c=;
 b=JfJhyVx12zvomd/AulHx+VlyG5B2gbFFkrz1pe1FdXeGsLw+NRlskC5Q0qzVahku2c
 BMULLWBuIhMQryzuSTU3j7QEfFg3liJmSWwhGawpn3YkBQV1CNg7Vg3WlthKyjGkNOsV
 VhdhOXBmIZNIVqtwrRyurz4vm3645x8N27pBaZSQG3/uYztRm1+yK4Lz9KkIIXt3T9xc
 QDqIx39FYxnmwmZFj/4n23NQGKCICgnQGCXQWLoj9ABmGqcwUbfdXNCYgkyA2mpAJX46
 5jf1EzIvLl9TPt88elZWusiDUQP/xBguo22+AlUQaVo/Ssb1stJGvgxNboWza3FVOedu
 2Omg==
X-Gm-Message-State: AOAM530uxs0EOFcNN1WJMeJTPSrvlt8AMi5Qi0GDyHrcQHuMy61PBV92
 rrtNN5z6ZamNizznb/YMjdHsIwvIyNpzR2WcC5bIa1FESXE=
X-Google-Smtp-Source: ABdhPJxjG9+XKDL2nuKi2W+QM9BrUWAJzSd68nq9Al1JVaNMnKFacS0NNJmC0amrXWYex35MjoU0mITjbMjNi5r5L3E=
X-Received: by 2002:a05:6122:8c8:b0:32a:7010:c581 with SMTP id
 8-20020a05612208c800b0032a7010c581mr5241750vkg.32.1647693953310; Sat, 19 Mar
 2022 05:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <751829.1647648125@warthog.procyon.org.uk>
In-Reply-To: <751829.1647648125@warthog.procyon.org.uk>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Mar 2022 13:46:25 +0100
Message-ID: <CAOi1vP_sEj7i8YbbwJibbSG=BCVp4E9BAo=JF0aC79xBNC8wcA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] Coordinating netfslib pull request with the
 ceph pull request
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 v9fs-developer@lists.sourceforge.net,
 Ceph Development <ceph-devel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 19, 2022 at 1:02 AM David Howells <dhowells@redhat.com> wrote:
>
> Hi Ilya,
>
> Since my fscache-next branch[1] is dependent on patches in the ceph/master
> branch, I think I need to coordinate my netfslib pull request with your ceph
> pull request for the upcoming merge window.
>
> David
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-next
>

Hi David,

Given how your branch is structured, it sounds like the easiest would
be for you to send the netfslib pull request after I send the ceph pull
request.  Or do you have some tighter coordination in mind?

Thanks,

                Ilya

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

