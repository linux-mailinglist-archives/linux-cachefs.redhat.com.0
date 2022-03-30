Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 417BF4EC84E
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 17:32:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-PyP3DTjEPMKSTBTdgM86tw-1; Wed, 30 Mar 2022 11:32:31 -0400
X-MC-Unique: PyP3DTjEPMKSTBTdgM86tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D89286B8A0;
	Wed, 30 Mar 2022 15:32:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56920C202CA;
	Wed, 30 Mar 2022 15:32:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 167A91947BBD;
	Wed, 30 Mar 2022 15:32:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5817D19451F3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 15:32:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A2DC400E11D; Wed, 30 Mar 2022 15:32:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46316400E10D
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 15:32:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D11A3C1EA44
 for <linux-cachefs@redhat.com>; Wed, 30 Mar 2022 15:32:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-gapPyFDbOv-NRMHgHtPMUA-1; Wed, 30 Mar 2022 11:32:15 -0400
X-MC-Unique: gapPyFDbOv-NRMHgHtPMUA-1
Received: by mail-lf1-f45.google.com with SMTP id m3so36455914lfj.11;
 Wed, 30 Mar 2022 08:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FiCY1+1uqLljeJe2aJ3pREcgiva9b8A+RgnrdrSgct4=;
 b=pKwwGWQ39rmNVEQs5sdlGhx0ELdUROj3QdC3binUn/nSqonxaZZtxaA8dDtRYcJqGl
 TKgxF9VpaMPnml/P2zr20Kji8pklwrt8yGFz4/jFDTYRqLEJ6sbO1amp9M6M+rl3BkXz
 hkocUP+nE8zJnQbZ8rn0ZrFWj3DerxbLg9W3PJYLWQQgLil7NixdnacgJSOBy+a0dvVW
 2WaWIdFO7PLl2KNGFu1m40qQlEHZrz5EWmYZuo5r3FDJ2geXUnSjfWB/dVfzJpw3WnND
 SPVXp5nejbitGnRJT8bPr7/LtQ7WlhJ9MGJy9+5GubO95VVA/L7/CDoaBe74nPEtCn6/
 WvSg==
X-Gm-Message-State: AOAM531C4YzFmo3KXXlEpHrYRZ0egEnyi/fM7B5KCfOOrrgbPPycwWyb
 tN3XiceYwB+0bMzaNx+eHoEQW/q8zg/8Rl7GljzK964+
X-Google-Smtp-Source: ABdhPJzHfPvYw9uiaE7XRh3Jvtsou7rAdT2mTkYkE5o8yC8/P9q79ohTZwmaVadlxkBqWHVjzJnpWCcPjKadRFdbSnI=
X-Received: by 2002:a05:6512:3b89:b0:44a:3ca5:8ae with SMTP id
 g9-20020a0565123b8900b0044a3ca508aemr7168069lfv.62.1648654331802; Wed, 30 Mar
 2022 08:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
 <2923709.1648636080@warthog.procyon.org.uk>
In-Reply-To: <2923709.1648636080@warthog.procyon.org.uk>
From: Chris Chilvers <chilversc@gmail.com>
Date: Wed, 30 Mar 2022 16:32:00 +0100
Message-ID: <CAAmbk-f4_mft=bLWPuHEzzpCiL4ikgkNvtCAWq_rd3=BQPzMJw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

File system was ext4 on a separate drive specificlly for fs-cache mounted
on /var/cache/fscache.

On Wed, 30 Mar 2022, 11:28 am David Howells, <dhowells@redhat.com> wrote:

> Chris Chilvers <chilversc@gmail.com> wrote:
>
> > While trying the new FS-Cache implementation using the 5.17-rc5 kernel on
> > Ubuntu 21.10 I ran into an issue where it appears that FS-Cache was not
> being
> > used when the sync mount option is enabled.
>
> What filesystem?
>
> David
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

