Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4F3347F52
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Mar 2021 18:28:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-iRCiZoIgME6BxYHqsebFkg-1; Wed, 24 Mar 2021 13:28:15 -0400
X-MC-Unique: iRCiZoIgME6BxYHqsebFkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65E6881621;
	Wed, 24 Mar 2021 17:28:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F387A382;
	Wed, 24 Mar 2021 17:28:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63EBB1809C83;
	Wed, 24 Mar 2021 17:28:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12OHS4PG010177 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 13:28:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA40A2157F26; Wed, 24 Mar 2021 17:28:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C282157F24
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 17:28:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80C04811E7F
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 17:28:01 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-303-2MbKzEJxNQuBKHXsaLmu0w-1; Wed, 24 Mar 2021 13:27:59 -0400
X-MC-Unique: 2MbKzEJxNQuBKHXsaLmu0w-1
Received: by mail-io1-f51.google.com with SMTP id v26so22359904iox.11
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 10:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XkvrcaymK6nSkgfkJGgjGP9hBUdmwS1OrQXMATb+QVk=;
	b=rcXP4hfUnA049PbLEaps8GNKBZ8At6QGVmgS5OiHTRY0MXdg13/DR+YkXht5q6R6em
	ITdHO9ZCYbwm0mDouuIzj0otnr1SE7xRSz6UAhkQvsNc39hk8CUCoU5QgdOAN0wscMEy
	AP+J2v+iAbpCXwmn7HRA/kXa59Uis+DNwtmjKfc2G+e5RQwv4U2fKJDJLbLIdylRTqE1
	+zPBov6NhxY44eLi3P0H2wQOAH1QYCgb8RHi/YppM4vBhvkL2bJKhJedfsSUjR5JjFMm
	yUmkhGIai+K8K1FpmnGrguOoGbc/qFLkgUKuh9BUCGMJx73bMXSck6/9j6lsIYhycckd
	Q8qw==
X-Gm-Message-State: AOAM533DF6z4gjAKA7SPspIM85IqloyrWhBn7gARRT6HFoJGLkcdVSrY
	rsI4Qbfo9gP8XVmANli9vP/V76QatE88KA==
X-Google-Smtp-Source: ABdhPJxqh08O7J/4Nu9bEJxdEAHzdqgi6ovED+hq0KAmmSfoLP0c+IIzkC+rjxTRLBon2qXI3xdIGA==
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr3350109ioh.210.1616606878038; 
	Wed, 24 Mar 2021 10:27:58 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
	[209.85.166.172])
	by smtp.gmail.com with ESMTPSA id c16sm1392627ils.2.2021.03.24.10.27.56
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 24 Mar 2021 10:27:57 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id t14so12248649ilu.3
	for <linux-cachefs@redhat.com>; Wed, 24 Mar 2021 10:27:56 -0700 (PDT)
X-Received: by 2002:a05:6e02:2161:: with SMTP id
	s1mr3520805ilv.161.1616606876703; 
	Wed, 24 Mar 2021 10:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <2813194.1616574081@warthog.procyon.org.uk>
In-Reply-To: <2813194.1616574081@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Mar 2021 10:27:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSVA4UnkQySJ1fu9joWJE1g48OxMCBYiApjE40G5ph5Q@mail.gmail.com>
Message-ID: <CAHk-=wjSVA4UnkQySJ1fu9joWJE1g48OxMCBYiApjE40G5ph5Q@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, Linux-MM <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] cachefiles, afs: mm wait fixes
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 24, 2021 at 1:21 AM David Howells <dhowells@redhat.com> wrote:
>
>  - I've included these together since they are an excerpt from a patch
>    series of Willy's, but I can send the first separately from the other
>    two if you'd prefer since they touch different modules.

It's small enough and related enough that one pull request makes sense.

>  - AuriStor (auristor.com) have added certain of my branches to their
>    automated AFS testing, hence the Tested-by kafs-testing@auristor.com tag
>    on the patches in this set.  Is this the best way to represent this?

Looks sane to me.

Thanks,
            Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

