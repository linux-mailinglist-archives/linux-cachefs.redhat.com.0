Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296C6495C3
	for <lists+linux-cachefs@lfdr.de>; Sun, 11 Dec 2022 19:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670783683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hEwmPHYF2sKLZ1fsv1v23N13wIv7MlYIupLNdvLsfOY=;
	b=WaYhAU548nerzMp8ll2U2Ey+9nCFEdVbXCnESdpv8Dow+8mSoU8kQHBCzB5KalE7AO7yCi
	opws9YPAsjWBFou6xPsmMiuRskrnGeMsLtk0Aa1rth2J1R9jwTn5ZeHbtSQL1bcDFnbyIp
	XFcS3Ti7bOIohnnbBCofREydvke/QIk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-w2hE50fLMVSM38YValoBMw-1; Sun, 11 Dec 2022 13:34:39 -0500
X-MC-Unique: w2hE50fLMVSM38YValoBMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E64F1C0515B;
	Sun, 11 Dec 2022 18:34:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69328492CA2;
	Sun, 11 Dec 2022 18:34:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19F44194658D;
	Sun, 11 Dec 2022 18:34:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC7871946588 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 11 Dec 2022 18:34:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A88ED4EA48; Sun, 11 Dec 2022 18:34:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D894EA53
 for <linux-cachefs@redhat.com>; Sun, 11 Dec 2022 18:34:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FAA73C025C5
 for <linux-cachefs@redhat.com>; Sun, 11 Dec 2022 18:34:36 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-aHG1r1ZzOMSybXd09KrhZA-1; Sun, 11 Dec 2022 13:34:35 -0500
X-MC-Unique: aHG1r1ZzOMSybXd09KrhZA-1
Received: by mail-qt1-f174.google.com with SMTP id fu10so7433796qtb.0
 for <linux-cachefs@redhat.com>; Sun, 11 Dec 2022 10:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VcIjNZvmXhwLlIH4qzTb3os7YT1CTCX89zz+g7s11S8=;
 b=5zpmmCwA5thNNVjYP1HI0EL6S7Jj2tVMTdJ7rUxrIMhbD0PYIZCqxuAwrJImkRLHun
 Uxrcts2mzbC0NKHbCWnvk6wbyDG0bvNZPxY2sHZklskd3S51xqInSGS4MFgAFzXPtA10
 rZ9y6o2WCuUQHtkjluR4NcKLOt7dAJ7fRUqB0uJVLVIQGqCthopkHqNKo6tCEruZ9n7R
 QYhIdwjnboqSPTs7oa5D0kUdi5pOxEDuoapR7XneFONflb2YjoEpGIZWKlnhFBFZ9Jg1
 CtGo6UHsRfTvcj49sjXAl9Xjia4Qbakot49i+9ZZH06z7B/IwBYKQlC81kF5/CrHh4Dr
 4uCg==
X-Gm-Message-State: ANoB5pnO1hkZkh9+BgQZJj9hZpjMQFhy+UYW3RddE3cnI9ym0OeRZg5I
 FG5l07fs2+r0W1p0vtRnwGtPX1GMi0uvSpma
X-Google-Smtp-Source: AA0mqf5g9zF8OJ6ItdHQsp5CUiRxbGnY39M3IplAB12yS/5X40oOxtBwCxc/xw++eYx+iFkI+7Sj2w==
X-Received: by 2002:ac8:4d8f:0:b0:3a6:8922:b71b with SMTP id
 a15-20020ac84d8f000000b003a68922b71bmr15773235qtw.55.1670783674106; 
 Sun, 11 Dec 2022 10:34:34 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05620a44c500b006f956766f76sm4481985qkp.1.2022.12.11.10.34.33
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 10:34:33 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id d2so6839951qvp.12
 for <linux-cachefs@redhat.com>; Sun, 11 Dec 2022 10:34:33 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr70224982qvp.129.1670783284766; Sun, 11
 Dec 2022 10:28:04 -0800 (PST)
MIME-Version: 1.0
References: <202212112131.994277de-oliver.sang@intel.com>
In-Reply-To: <202212112131.994277de-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 Dec 2022 10:27:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wipgS=05hJdztC8sJj01wpxMKQ67tV53UyFa2WtZ93o5A@mail.gmail.com>
Message-ID: <CAHk-=wipgS=05hJdztC8sJj01wpxMKQ67tV53UyFa2WtZ93o5A@mail.gmail.com>
To: kernel test robot <oliver.sang@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Linux-cachefs]
 [ammarfaizi2-block:dhowells/linux-fs/fscache-fixes] [mm, netfs,
 fscache] 6919cda8e0: canonical_address#:#[##]
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org, lkp@intel.com,
 Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>, linux-cifs@vger.kernel.org,
 ceph-devel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com, GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 oe-lkp@lists.linux.dev, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Dominique Martinet <asmadeus@codewreck.org>,
 linux-mm@kvack.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The disassembly isn't great, because the test robot doesn't try to
find where the instructions start, but before that

>    4:   48 8b 57 18             mov    0x18(%rdi),%rdx

instruction we also had a

      mov    (%rdi),%rax

and it looks like this is the very top of 'filemap_release_folio()',
so '%rdi' contains the folio pointer coming into this.

End result:

On Sun, Dec 11, 2022 at 6:27 AM kernel test robot <oliver.sang@intel.com> wrote:
>
>    4:   48 8b 57 18             mov    0x18(%rdi),%rdx
>    8:   83 e0 01                and    $0x1,%eax
>    b:   74 59                   je     0x66

The

    and    $0x1,%eax
    je     0x66

above is the test for

    BUG_ON(!folio_test_locked(folio));

where it's jumping out to the 'ud2' in case the lock bit (bit #0) isn't set.

Then we have this:

>    d:   48 f7 07 00 60 00 00    testq  $0x6000,(%rdi)
>   14:   74 22                   je     0x38

Which is testing PG_private | PG_private2, and jumping out (which we
also don't do) if neither is set.

And then we have:

>   16:   48 8b 07                mov    (%rdi),%rax
>   19:   f6 c4 80                test   $0x80,%ah
>   1c:   75 32                   jne    0x50

Which is checking for PG_writeback.

So then we get to

    if (mapping && mapping->a_ops->release_folio)
            return mapping->a_ops->release_folio(folio, gfp);

which is this:

>   1e:   48 85 d2                test   %rdx,%rdx
>   21:   74 34                   je     0x57

This %rdx value is the early load from the top of the function, it's
checking 'mapping' for NULL.

It's not NULL, but it's some odd value according to the oops report:

  RDX: ffff889f03987f71

which doesn't look like it's valid (well, it's a valid kernel pointer,
but it's not aligned like a 'mapping' pointer should be.

So now when we're going to load 'a_ops' from there, we load another
garbage value:

>   23:   48 8b 82 90 00 00 00    mov    0x90(%rdx),%rax

and we now have RAX: b000000000000000

and then the 'a_ops->release_folio' access will trap:

>   2a:*  48 8b 40 48             mov    0x48(%rax),%rax          <-- trapping instruction
>   2e:   48 85 c0                test   %rax,%rax
>   31:   74 24                   je     0x57

The above is the "load a_ops->release_folio and test it for NULL", but
the load took a page fault because RAX was garbage.

But RAX was garbage because we already had a bogus "mapping" pointer earlier.

Now, why 'mapping' was bogus, I don't know. Maybe that page wasn't a
page cache page at all? The mapping field is in a union and can
contain other things.

So I have no explanation for the oops, but I thought I'd just post the
decoding of the instruction stream in case that helps somebody else to
figure it out.

                 Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

