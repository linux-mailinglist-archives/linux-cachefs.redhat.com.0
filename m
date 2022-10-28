Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F8610E89
	for <lists+linux-cachefs@lfdr.de>; Fri, 28 Oct 2022 12:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666953258;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DRl4pjmDPWklYvV5HL2WWE7g9GQCO4G2+al4Kebdco8=;
	b=A8g4PXVhaQ8d4czlaAgXvkiHUHP6zo2MOt0ARroZmjUlL8AK6udgIPpQudYVFsHqteUP3a
	H86dQswVsqJI6CjW3k9JcvqpqU3x7OgyOyrS9S71mRiogS753J1FxYCTn8IfOMhO+XDWyT
	azB2UXm8nS3mCj53VMzupSDSSgQuyps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-0sIlveA1MSWlIORHXmPMUQ-1; Fri, 28 Oct 2022 06:34:15 -0400
X-MC-Unique: 0sIlveA1MSWlIORHXmPMUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0EC580A0AE;
	Fri, 28 Oct 2022 10:34:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8D642238;
	Fri, 28 Oct 2022 10:33:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7980419465B2;
	Fri, 28 Oct 2022 10:33:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C44E11946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 10:33:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2965B40C958E; Fri, 28 Oct 2022 10:33:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21C0240C958D
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 10:33:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DED8800B30
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 10:33:48 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-FQTLCUA4PWmgyKzp15FYrg-1; Fri, 28 Oct 2022 06:33:35 -0400
X-MC-Unique: FQTLCUA4PWmgyKzp15FYrg-1
Received: by mail-pj1-f72.google.com with SMTP id
 nl16-20020a17090b385000b002138288fd51so2049918pjb.6
 for <linux-cachefs@redhat.com>; Fri, 28 Oct 2022 03:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9uk+UYhAa3jQRoZ61Y7+EdWkXdIPFLbr3gxr6x2ocAc=;
 b=yISY6tOD87dQwtK8ZQlQVSiaG7X1c3KKU/LHRF0nDSbmtX6pOoinuj6vFzg4a1mzol
 JVAbGVu6xDNAj/mjO6zQtpmLVMBFI+Sqw2VIr+p2vjxTzW4+QTLVP3mRlL4ybsUWCax8
 dwCNFEe6qXp5s6ZroY6PRqyvEdbiW0F5IfhxzdsPdMeAAScKPhiij70hq2I10Qd++Pfk
 l33CsIb4Fhpn0HkqlHK1akTTHwQILT2b50q8HwRH0NnSkcuUjM+edSCBD92Bp4oUYwuJ
 fa3bYz8FBIXE4MffA0qEwBzj/flax10eJtKPGItOy2dwxIDPNvj+qeD3VhrfNiNd87jP
 vhNQ==
X-Gm-Message-State: ACrzQf1fsHmaXovYHqc7xtiULVl7Axk8Ox63qbG1MGqDAmFVsUUJnWKG
 lx6Hz+WgDU/Ev5bTva3O4DBZQO1EJMgQW+TB7vdYKM4QUTJHr+8lKKeohxs8VoTpPc1dxjfbToL
 6J4QTeEuxVSB3Nn0d/ldGa4FhdMtpTrksYTJuvg==
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr5528938pgd.395.1666953214201; 
 Fri, 28 Oct 2022 03:33:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CDUGlxiti4C8hgOHRguFAQ3QHMrWUKDeS0p8ygNaYojJN5ZX9Wa2//oSKhF2YkC4g3bgZL1f+aTZ/8Mqb+9I=
X-Received: by 2002:a63:8aca:0:b0:461:25fe:e7c5 with SMTP id
 y193-20020a638aca000000b0046125fee7c5mr5528907pgd.395.1666953213864; Fri, 28
 Oct 2022 03:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221017105212.77588-1-dwysocha@redhat.com>
 <20221017105212.77588-2-dwysocha@redhat.com>
 <010f7996fde7dc4aa7a21e4b2b835d5ae7084771.camel@kernel.org>
In-Reply-To: <010f7996fde7dc4aa7a21e4b2b835d5ae7084771.camel@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 28 Oct 2022 06:32:57 -0400
Message-ID: <CALF+zOkC4F-g5sW1-v5eyyFph_JuSuSrLMbQ-3Uk71_QN2d75Q@mail.gmail.com>
To: Trond Myklebust <trondmy@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v9 1/5] NFS: Rename
 readpage_async_filler to nfs_pageio_add_page
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
Cc: linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 2:07 PM Trond Myklebust <trondmy@kernel.org> wrote:
>
> On Mon, 2022-10-17 at 06:52 -0400, Dave Wysochanski wrote:
> > Rename readpage_async_filler to nfs_pageio_add_page to
> > better reflect what this function does (add a page to
> > the nfs_pageio_descriptor), and simplify arguments to
> > this function by removing struct nfs_readdesc.
> >
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/nfs/read.c | 60 +++++++++++++++++++++++++------------------------
> > --
> >  1 file changed, 30 insertions(+), 30 deletions(-)
> >
> > diff --git a/fs/nfs/read.c b/fs/nfs/read.c
> > index 8ae2c8d1219d..525e82ea9a9e 100644
> > --- a/fs/nfs/read.c
> > +++ b/fs/nfs/read.c
> > @@ -127,11 +127,6 @@ static void nfs_readpage_release(struct nfs_page
> > *req, int error)
> >         nfs_release_request(req);
> >  }
> >
> > -struct nfs_readdesc {
> > -       struct nfs_pageio_descriptor pgio;
> > -       struct nfs_open_context *ctx;
> > -};
> > -
> >  static void nfs_page_group_set_uptodate(struct nfs_page *req)
> >  {
> >         if (nfs_page_group_sync_on_bit(req, PG_UPTODATE))
> > @@ -153,7 +148,8 @@ static void nfs_read_completion(struct
> > nfs_pgio_header *hdr)
> >
> >                 if (test_bit(NFS_IOHDR_EOF, &hdr->flags)) {
> >                         /* note: regions of the page not covered by a
> > -                        * request are zeroed in
> > readpage_async_filler */
> > +                        * request are zeroed in nfs_pageio_add_page
> > +                        */
> >                         if (bytes > hdr->good_bytes) {
> >                                 /* nothing in this request was good,
> > so zero
> >                                  * the full extent of the request */
> > @@ -281,8 +277,10 @@ static void nfs_readpage_result(struct rpc_task
> > *task,
> >                 nfs_readpage_retry(task, hdr);
> >  }
> >
> > -static int
> > -readpage_async_filler(struct nfs_readdesc *desc, struct page *page)
> > +int
> > +nfs_pageio_add_page(struct nfs_pageio_descriptor *pgio,
> > +                   struct nfs_open_context *ctx,
> > +                   struct page *page)
>
> If we're going to rename this function, then let's not give it a name
> that suggests it belongs in pagelist.c. It's not a generic helper
> function, but is still very much specific to the pagecache read
> functionality.
>

How about nfs_read_add_page()?




> >  {
> >         struct inode *inode = page_file_mapping(page)->host;
> >         unsigned int rsize = NFS_SERVER(inode)->rsize;
> > @@ -302,15 +300,15 @@ readpage_async_filler(struct nfs_readdesc
> > *desc, struct page *page)
> >                         goto out_unlock;
> >         }
> >
> > -       new = nfs_create_request(desc->ctx, page, 0, aligned_len);
> > +       new = nfs_create_request(ctx, page, 0, aligned_len);
> >         if (IS_ERR(new))
> >                 goto out_error;
> >
> >         if (len < PAGE_SIZE)
> >                 zero_user_segment(page, len, PAGE_SIZE);
> > -       if (!nfs_pageio_add_request(&desc->pgio, new)) {
> > +       if (!nfs_pageio_add_request(pgio, new)) {
> >                 nfs_list_remove_request(new);
> > -               error = desc->pgio.pg_error;
> > +               error = pgio->pg_error;
> >                 nfs_readpage_release(new, error);
> >                 goto out;
> >         }
> > @@ -332,7 +330,8 @@ readpage_async_filler(struct nfs_readdesc *desc,
> > struct page *page)
> >  int nfs_read_folio(struct file *file, struct folio *folio)
> >  {
> >         struct page *page = &folio->page;
> > -       struct nfs_readdesc desc;
> > +       struct nfs_pageio_descriptor pgio;
> > +       struct nfs_open_context *ctx;
> >         struct inode *inode = page_file_mapping(page)->host;
> >         int ret;
> >
> > @@ -358,29 +357,29 @@ int nfs_read_folio(struct file *file, struct
> > folio *folio)
> >
> >         if (file == NULL) {
> >                 ret = -EBADF;
> > -               desc.ctx = nfs_find_open_context(inode, NULL,
> > FMODE_READ);
> > -               if (desc.ctx == NULL)
> > +               ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> > +               if (ctx == NULL)
> >                         goto out_unlock;
> >         } else
> > -               desc.ctx =
> > get_nfs_open_context(nfs_file_open_context(file));
> > +               ctx =
> > get_nfs_open_context(nfs_file_open_context(file));
> >
> > -       xchg(&desc.ctx->error, 0);
> > -       nfs_pageio_init_read(&desc.pgio, inode, false,
> > +       xchg(&ctx->error, 0);
> > +       nfs_pageio_init_read(&pgio, inode, false,
> >                              &nfs_async_read_completion_ops);
> >
> > -       ret = readpage_async_filler(&desc, page);
> > +       ret = nfs_pageio_add_page(&pgio, ctx, page);
> >         if (ret)
> >                 goto out;
> >
> > -       nfs_pageio_complete_read(&desc.pgio);
> > -       ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
> > +       nfs_pageio_complete_read(&pgio);
> > +       ret = pgio.pg_error < 0 ? pgio.pg_error : 0;
> >         if (!ret) {
> >                 ret = wait_on_page_locked_killable(page);
> >                 if (!PageUptodate(page) && !ret)
> > -                       ret = xchg(&desc.ctx->error, 0);
> > +                       ret = xchg(&ctx->error, 0);
> >         }
> >  out:
> > -       put_nfs_open_context(desc.ctx);
> > +       put_nfs_open_context(ctx);
> >         trace_nfs_aop_readpage_done(inode, page, ret);
> >         return ret;
> >  out_unlock:
> > @@ -391,9 +390,10 @@ int nfs_read_folio(struct file *file, struct
> > folio *folio)
> >
> >  void nfs_readahead(struct readahead_control *ractl)
> >  {
> > +       struct nfs_pageio_descriptor pgio;
> > +       struct nfs_open_context *ctx;
> >         unsigned int nr_pages = readahead_count(ractl);
> >         struct file *file = ractl->file;
> > -       struct nfs_readdesc desc;
> >         struct inode *inode = ractl->mapping->host;
> >         struct page *page;
> >         int ret;
> > @@ -407,25 +407,25 @@ void nfs_readahead(struct readahead_control
> > *ractl)
> >
> >         if (file == NULL) {
> >                 ret = -EBADF;
> > -               desc.ctx = nfs_find_open_context(inode, NULL,
> > FMODE_READ);
> > -               if (desc.ctx == NULL)
> > +               ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
> > +               if (ctx == NULL)
> >                         goto out;
> >         } else
> > -               desc.ctx =
> > get_nfs_open_context(nfs_file_open_context(file));
> > +               ctx =
> > get_nfs_open_context(nfs_file_open_context(file));
> >
> > -       nfs_pageio_init_read(&desc.pgio, inode, false,
> > +       nfs_pageio_init_read(&pgio, inode, false,
> >                              &nfs_async_read_completion_ops);
> >
> >         while ((page = readahead_page(ractl)) != NULL) {
> > -               ret = readpage_async_filler(&desc, page);
> > +               ret = nfs_pageio_add_page(&pgio, ctx, page);
> >                 put_page(page);
> >                 if (ret)
> >                         break;
> >         }
> >
> > -       nfs_pageio_complete_read(&desc.pgio);
> > +       nfs_pageio_complete_read(&pgio);
> >
> > -       put_nfs_open_context(desc.ctx);
> > +       put_nfs_open_context(ctx);
> >  out:
> >         trace_nfs_aop_readahead_done(inode, nr_pages, ret);
> >  }
>
> --
> Trond Myklebust
> Linux NFS client maintainer, Hammerspace
> trond.myklebust@hammerspace.com
>
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

