Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E485F4FF1F5
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Apr 2022 10:32:02 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-Mz2Hl8TBM3e3CiHN-dRzEw-1; Wed, 13 Apr 2022 04:31:58 -0400
X-MC-Unique: Mz2Hl8TBM3e3CiHN-dRzEw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC47D803D42;
	Wed, 13 Apr 2022 08:31:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA60416385;
	Wed, 13 Apr 2022 08:31:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF7D01940374;
	Wed, 13 Apr 2022 08:31:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C07731949763 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 13 Apr 2022 08:31:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A945340EC01C; Wed, 13 Apr 2022 08:31:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB7540E80F8
 for <linux-cachefs@redhat.com>; Wed, 13 Apr 2022 08:31:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7896B3802129
 for <linux-cachefs@redhat.com>; Wed, 13 Apr 2022 08:31:53 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-SnGfSjCpPAqDrpzTa-skPQ-1; Wed, 13 Apr 2022 04:31:49 -0400
X-MC-Unique: SnGfSjCpPAqDrpzTa-skPQ-1
Received: by mail-lf1-f51.google.com with SMTP id x33so2235107lfu.1;
 Wed, 13 Apr 2022 01:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8CJtmNtuV4U5b2rJcZ+MTxlOtWUwqLdpla0k1eaomDs=;
 b=AF5Ouga9DP8NIFFj1gYFCiC8nm6DriPAOMLSYtVbo0hTF+uVIzIWTcceTwHznzYDGm
 1gdDxnZMX4+8fbNQ/vQ870q3rgIZhRL2ghEUFHIJVE/ln9fNWgFgmFiViKTFZIGtfLks
 L/bohH6yoa9b2Qxe7W37/OszNMEDkX24Cu7XbdQ/R/4Y/8G3YHdAeLN8oLUsMRJ3hivh
 9xwQ3XY84LrPp7XX8dS9YdNhM3CbCBQWFWdhFnK1quPNzKIApGEkBrcKlmt7WEi6DLVx
 SIkYQY2fgvFaZ9Z4xo0Xbm/pEj/RIwjB/gUrJZ7mzPWzJKu/bo2+75IEiVghIP0nm8Zu
 hKhg==
X-Gm-Message-State: AOAM531c8/8Ee+idd2kplRq0VS4+7ywS5uz61XEWvInG36DX7/yhsn5T
 aQMTSqGUfofXN3xfO4lZi2EBu7DOut6QOhp0jwphEtoc
X-Google-Smtp-Source: ABdhPJx0qchrSy7KwJuYKQs/mHD8uMVxzX3hVUPgUrnRR/T9YHlBX+LpDR7Yn8oLioCxSP5d+Il06GVY4VHI7IuOKu0=
X-Received: by 2002:a05:6512:2627:b0:44a:f55c:ded9 with SMTP id
 bt39-20020a056512262700b0044af55cded9mr28246540lfb.373.1649838707524; Wed, 13
 Apr 2022 01:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
 <2923709.1648636080@warthog.procyon.org.uk>
 <CAAmbk-f4_mft=bLWPuHEzzpCiL4ikgkNvtCAWq_rd3=BQPzMJw@mail.gmail.com>
 <2997201.1648655756@warthog.procyon.org.uk>
In-Reply-To: <2997201.1648655756@warthog.procyon.org.uk>
From: Chris Chilvers <chilversc@gmail.com>
Date: Wed, 13 Apr 2022 09:31:38 +0100
Message-ID: <CAAmbk-cX03xAHrYcRdvDTum4NGFSq4FSB=+i4gqsK-fq9hmraQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [Linux-cachefs] [BUG] write but no read when using sync mount
 option
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Network file system was NFS, though I forgot to note if I was mounting it
as NFS v3, or v4.1.

On Wed, 30 Mar 2022, 4:56 pm David Howells, <dhowells@redhat.com> wrote:

> Chris Chilvers <chilversc@gmail.com> wrote:
>
> > File system was ext4 on a separate drive specificlly for fs-cache
> mounted on
> > /var/cache/fscache.
>
> I meant which network filesystem.
>
> David
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

