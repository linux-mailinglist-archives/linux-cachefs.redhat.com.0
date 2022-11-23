Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5F6368B2
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 19:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669228025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UYFZodEsGpjwHmjpRJMY7li4SfJoJXjuLy6KA/+8vEY=;
	b=T76WHQRbEoD12L51MCHFKSxl1h6fVDHtVKiLILDnIeD+g+dBRTwbb5nL9uA50JUTUSfkrG
	sLloUg+jecMxUVSzHSo61Y+MUZHgkp8Cszh0lR2AHhYxoYevpVDJFQ8vXg4rd/RH7MKaWG
	NnPQAB8EpHui1nX0JXW5eqY6UXzL5B8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-Bu3p8tVXNNO3RNWI5H7f0A-1; Wed, 23 Nov 2022 13:27:02 -0500
X-MC-Unique: Bu3p8tVXNNO3RNWI5H7f0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94BF1C05AAF;
	Wed, 23 Nov 2022 18:27:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58B4D2166B26;
	Wed, 23 Nov 2022 18:27:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 120A8194658D;
	Wed, 23 Nov 2022 18:27:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8E8F11946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 18:26:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7F5BA2024CC8; Wed, 23 Nov 2022 18:26:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 788DD2024CBE
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 18:26:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 591EB85A5B6
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 18:26:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-ta8PSYpWNUKYzdR2ePyvjg-1; Wed, 23 Nov 2022 13:26:56 -0500
X-MC-Unique: ta8PSYpWNUKYzdR2ePyvjg-1
Received: by mail-qk1-f169.google.com with SMTP id c2so1142242qko.1
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 10:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/jG5QaYqTRKNFcJtqKGHj4SfbKFSJH0wslCbBk+0rc=;
 b=iDCwGnGoJYzUysCbYjrMzDGJ1UnR9enQN6y0JrfqY7T8KgI12i3Hl87NmpV60rnIgG
 2Y/ICjc9jTU4bzX8/b2UhCQpDa/fBSiDdRmTTCqgFAiUoCFjqyiwz14RduibljbIofi4
 J10BdyRRJrKo7SIvrxko/l5bVCERvRc5c4rZy4utEaP02nNVJ+DvyPw3H9vICgKSTIhv
 sl+P6poZmkuqgzduzAffoeh4QwnJ+DcDujMmEQRtb05MxejYvWi4zKOwXkU7YNQXcv1i
 YJZNj2If+pspidrhc43CbdA12e+f7plgN4ilgcyV3PmSdcwmlencQOk0/RUiwvtCoP6V
 ulRg==
X-Gm-Message-State: ANoB5pmeDmUw0z7v94aTytAiaSKaaOwR49jbnBgrE9bZZ1CER1cMLUkE
 AhqCdhUgrBLKPqvtaiHm83CVURexENSaIA==
X-Google-Smtp-Source: AA0mqf7G8Xy4EltbsZgCERmu0IGo0wA8vZNjGILIsx7W6kaeo1lSPaX5pyFqMmRLoB0CsfzNKzpc5Q==
X-Received: by 2002:a05:620a:484:b0:6fa:2aec:52b0 with SMTP id
 4-20020a05620a048400b006fa2aec52b0mr17270329qkr.740.1669228015940; 
 Wed, 23 Nov 2022 10:26:55 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 bi40-20020a05620a31a800b006f7ee901674sm12515396qkb.2.2022.11.23.10.26.52
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 10:26:54 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id z6so11776987qtv.5
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 10:26:52 -0800 (PST)
X-Received: by 2002:ac8:41cd:0:b0:3a5:1ba7:717d with SMTP id
 o13-20020ac841cd000000b003a51ba7717dmr9188380qtm.678.1669228012067; Wed, 23
 Nov 2022 10:26:52 -0800 (PST)
MIME-Version: 1.0
References: <1459152.1669208550@warthog.procyon.org.uk>
In-Reply-To: <1459152.1669208550@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Nov 2022 10:26:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wghJtq-952e_8jd=vtV68y_HsDJ8=e0=C3-AsU2WL-8YA@mail.gmail.com>
Message-ID: <CAHk-=wghJtq-952e_8jd=vtV68y_HsDJ8=e0=C3-AsU2WL-8YA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH v3] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 23, 2022 at 5:02 AM David Howells <dhowells@redhat.com> wrote:
>
> Is the attached patch too heavy to be applied this late in the merge cycle?
> Or would you prefer it to wait for the merge window?

This patch is much too much for this point in the release.

But I also think it's strange in another way, with that odd placement of

        mapping_clear_release_always(inode->i_mapping);

at inode eviction time. That just feels very random.

Similarly, that change to shrink_folio_list() looks strange, with the
nasty folio_needs_release() helper. It seems entirely pointless, with
the use then being

                if (folio_needs_release(folio)) {
                        if (!filemap_release_folio(folio, sc->gfp_mask))
                                goto activate_locked;

when everybody else is just using filemap_release_folio() and checking
its return value. I like how you changed other cases of

        if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
                return 0;

to just use "!filemap_release_folio()" directly, and that felt like a
cleanup, but the shrink_folio_list() changes look like a step
backwards.

And the change to mm/filemap.c is completely unacceptable in all
forms, and this added test

+       if ((!mapping || !mapping_release_always(mapping)) &&
+           !folio_test_private(folio) &&
+           !folio_test_private_2(folio))
+               return true;

will not be accepted even during the merge window. That code makes no
sense what-so-ever, and is in no way acceptable.

That code makes no sense what-so-ever. Why isn't it using
"folio_has_private()"? Why is it using it's own illegible version of
that that doesn't match any other case? Why is this done as an
open-coded - and *badly* so - version of !folio_needs_release() that
you for some reason made private to mm/vmscan.c?

So no, this patch is too ugly to apply as-is *ever*, much less during
the late rc series.

                 Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

